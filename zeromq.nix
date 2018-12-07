{ stdenv, fetchFromGitHub, cmake, asciidoc }:

stdenv.mkDerivation rec {
  name = "zeromq-${version}";
  version = "4.0.4";

  src = fetchFromGitHub {
    owner = "zeromq";
    repo = "zeromq4-x";
    rev = "1ac53ed1f75202bbe36dd0b409736f90984638e5";
    sha256 = "0hvxb2wwsb41y4xm7g9fggxfx487z7ncpxdyjwkczzd2c85jkcfj";
  };

  nativeBuildInputs = [ cmake asciidoc ];

  enableParallelBuilding = true;

  doCheck = false; # fails all the tests (ctest)
}