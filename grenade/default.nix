{ mkDerivation, fetchFromGitHub, ambiata-disorder-core, attoparsec, base
, bytestring, either, exceptions, hmatrix, MonadRandom, mtl
, optparse-applicative, parallel, primitive, QuickCheck
, quickcheck-instances, singletons, stdenv, text, transformers
}:
mkDerivation {
  pname = "grenade";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "HuwCampbell";
    repo = "grenade";
    rev = "b8e0450cbd3e65879ad9adae6191eec2d78f7665";
    sha256 = "0flgyiv381jwxp5hwynylszym9fw4lmdn33qv6lwk57c2w82csw6";
  };
  patches = [ ./QuickCheck_version.patch ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring either exceptions hmatrix MonadRandom mtl parallel
    primitive singletons text transformers
  ];
  executableHaskellDepends = [
    attoparsec base either hmatrix MonadRandom mtl optparse-applicative
    singletons text transformers
  ];
  testHaskellDepends = [
    ambiata-disorder-core base hmatrix mtl QuickCheck
    quickcheck-instances text
  ];
  description = "grenade";
  license = stdenv.lib.licenses.bsd2;
}
