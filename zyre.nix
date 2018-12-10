# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Meta

{ stdenv
, fetchFromGitHub
, cmake
, coast-czmq
, coast-libsodium
, coast-zeromq
}:

let
  version = "1.1.0";
in

stdenv.mkDerivation {
  name = "zyre-${version}";

  # src = fetchFromGitHub {
  #   owner = "zeromq";
  #   repo = "zyre";
  #   rev = "e1e5b95672bebac0d28173fe134c4f911e4ccf09"; #"a351468b7d313fc90c446668122365851a9c60e4";
  #   sha256 = "18hz9wsrcn5h69022836xrc0ymfcxdmbwsk6285l3ryz67jrf61b";
  # };
  src = ../coast2/zeromq/zyre; # LOL, use COAST's vendored & altered version of zyre :/

  buildInputs = [ coast-libsodium coast-zeromq ];
  nativeBuildInputs = [ cmake coast-czmq ];
  NIX_CFLAGS_COMPILE = "-Wno-error";
  # enableParallelBuilding = true; #?
}
