# Nix-package description for `grenade` [1]
#
# Build the package by executing the following command, assuming that you have
# Nix [2] installed.
#
#   nix-build -A haskellPackages.grenade .
#
# If you want to use your current revision of `nixpkgs` then execute the
# following command.
#
#   nix-build --arg nixpkgs '<nixpkgs>' -A haskellPackages.grenade .
#
# Execute the following command to be placed in a development shell that has
# all of `grenade`'s dependencies available. `cabal configure` will be able to
# pick them up.
#
#   nix-shell -A haskellPackages.grenade.env .
#
# For further details refer to the documentation of the Haskell infrastructure
# in Nix [3].
#
# [1]: https://github.com/HuwCampbell/grenade
# [2]: http://nixos.org/nix/
# [3]: http://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure

let

  # Tested with the following revision of `nixpkgs`.
  nixpkgs_default = (import <nixpkgs> {}).fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "df8958435e1fd0c6d55394e95d3d3d2e0edca474";
    sha256 = "0zvn0xsz4qj9rm2yzfn2zqpygi8nh5zzi9pjl3qr12m8ki9a78zy";
  };

  config = { pkgs }: {

    # Add `grenade` and its dependencies to the Haskell package set.
    packageOverrides = super: let self = super.pkgs; in {
      haskellPackages = super.haskellPackages.override {
        overrides = self: super: {
          ambiata-disorder-core = self.callPackage ./ambiata-disorder-core {};
          grenade = dontHaddock (self.callPackage ./grenade {});
          hmatrix = self.callPackage ./hmatrix {};
          quickcheck-text = self.callPackage ./quickcheck-text {};
        };
      };
    };

    # `ambiata-disorder-core` has an unfree license.
    allowUnfree = true;

  };

  # Stolen from <nixpkgs/pkgs/development/haskell-modules/lib.nix>
  # <snip>
  overrideCabal = drv: f: (drv.override (args: args // {
    mkDerivation = drv: args.mkDerivation (drv // f drv);
  })) // {
    overrideScope = scope: overrideCabal (drv.overrideScope scope) f;
  };

  dontHaddock = drv: overrideCabal drv (drv: { doHaddock = false; });
  # </snip>

in

{ system ? builtins.currentSystem, nixpkgs ? nixpkgs_default }:

import nixpkgs { inherit system config; }
