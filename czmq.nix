{ stdenv
, fetchFromGitHub
, coast-zeromq
, cmake
}:

stdenv.mkDerivation rec {
  name = "czmq-${version}";
  version = "2.2.0";

  # src = fetchFromGitHub {
  #   owner = "zeromq";
  #   repo = "czmq";
  #   rev = "b0e9b7f1448f9b0546c700ea0a46dc8bb0dd2ebd";
  #   sha256 = "1lva0jmiv0khk429baw79cj8rwnij2wmz1x89q027y2xgjg44k8h";
  # };
  src = ../coast2/zeromq/czmq; # LOL, use COAST's vendored & altered version

  nativeBuildInputs = [ cmake ];
  propagatedBuildInputs = [ coast-zeromq ]; # Needs to be propagated for the .pc file to work
  NIX_CFLAGS_COMPILE = "-Wno-error";
}
