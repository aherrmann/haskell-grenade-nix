{ mkDerivation, fetchFromGitHub, base, directory, ieee754, process, QuickCheck
, quickcheck-instances, quickcheck-text, stdenv, template-haskell
, text, transformers
}:
mkDerivation {
  pname = "ambiata-disorder-core";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "ambiata";
    repo = "disorder.hs";
    rev = "43d08f1b4b3e0d43aa3233b7b5a3ea785c1d357b";
    sha256 = "1yc04d9dw12way34n17m79wls9pz1bbf4nssy12sxmn12qv28hbg";
  };
  postUnpack = "sourceRoot=$sourceRoot/disorder-core";
  libraryHaskellDepends = [
    base directory ieee754 process QuickCheck quickcheck-text
    template-haskell text transformers
  ];
  testHaskellDepends = [
    base ieee754 QuickCheck quickcheck-instances text transformers
  ];
  description = "disorder-core";
  license = stdenv.lib.licenses.unfree;
}
