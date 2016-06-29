# Nix-package description for [Grenade][1]

Build the package by executing the following command, assuming that you have
[Nix][2] installed.

    nix-build -A haskellPackages.grenade .

If you want to use your current revision of `nixpkgs` then execute the
following command.

    nix-build --arg nixpkgs '<nixpkgs>' -A haskellPackages.grenade .

Execute the following command to be placed in a development shell that has
all of Grenade's dependencies available. `cabal configure` will be able to
pick them up.

    nix-shell -A haskellPackages.grenade.env .

For further details refer to the [documentation of the Haskell infrastructure
in Nix][3].

[1]: https://github.com/HuwCampbell/grenade
[2]: http://nixos.org/nix/
[3]: http://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure
