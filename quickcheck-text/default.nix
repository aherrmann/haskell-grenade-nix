{ mkDerivation, fetchFromGitHub, base, binary, bytestring, QuickCheck, stdenv
, text
}:
mkDerivation {
  pname = "quickcheck-text";
  version = "0.1.1.1";
  src = fetchFromGitHub {
    owner = "olorin";
    repo = "quickcheck-text";
    rev = "d4ded4f10c754634d7a5396280881f8fa898f6aa";
    sha256 = "012c3gisw9qs67hy9z466lx7hgx5sgbfsvrvwf18zhllchp79cxv";
  };
  libraryHaskellDepends = [ base binary bytestring QuickCheck text ];
  testHaskellDepends = [ base bytestring QuickCheck text ];
  homepage = "https://github.com/olorin/quickcheck-text";
  description = "Alternative arbitrary instance for Text";
  license = stdenv.lib.licenses.mit;
}
