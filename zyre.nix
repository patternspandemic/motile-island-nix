# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Meta

{ stdenv
, autoreconfHook
, fetchFromGitHub
, pkgconfig
, czmq
, libsodium
, zeromq
}:

let
  version = "2.0.0";
in

stdenv.mkDerivation {
  name = "zyre-${version}";

  src = fetchFromGitHub {
    owner = "zeromq";
    repo = "zyre";
    rev = "ab263dac21250fc85fa8c7239973109eca2251a7";
    sha256 = "1iwg0yqnrn8njjqv2ycifygzxrwd5g5kaszln0hy05m1c0xi44ik";
  };

  buildInputs = [ czmq libsodium zeromq ];
  nativeBuildInputs = [ autoreconfHook pkgconfig ];

}
