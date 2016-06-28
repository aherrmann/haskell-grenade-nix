{ mkDerivation, fetchFromGitHub, array, base, binary, bytestring, deepseq
, openblasCompat, random, split, stdenv, storable-complex, vector
}:
mkDerivation {
  pname = "hmatrix";
  version = "0.18.0.0";
  src = fetchFromGitHub {
    owner = "albertoruiz";
    repo = "hmatrix";
    rev = "9aade51bd0bb6339cfa8aca014bd96f801d9b19e";
    sha256 = "0fjd7bfx0h4w887j2hm3agfhjchsxj0xzp205xaa4fpgq7fw9k3y";
  };
  postUnpack = "sourceRoot=$sourceRoot/packages/base";
  configureFlags = [ "-fopenblas" ];
  libraryHaskellDepends = [
    array base binary bytestring deepseq random split storable-complex
    vector
  ];
  librarySystemDepends = [ openblasCompat ];
  preConfigure = "sed -i hmatrix.cabal -e 's@/usr/@/dont/hardcode/paths/@'";
  homepage = "https://github.com/albertoruiz/hmatrix";
  description = "Numeric Linear Algebra";
  license = stdenv.lib.licenses.bsd3;
}
