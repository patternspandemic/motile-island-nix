# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Hitch up libs to racket? Motile/Island source...

{ stdenv
, coast-czmq
, coast-libfastlz
, coast-libsodium
, coast-motile-island
, coast-zeromq
, coast-zyre
, curl
, racket
}:

let
  inherit (stdenv.lib) makeLibraryPath;
  envLibs = [
    curl
    coast-czmq
    coast-libfastlz
    coast-libsodium
    coast-zeromq
    coast-zyre
  ];
in

stdenv.mkDerivation {
  name = "motile-island-env";
  buildInputs = [ racket coast-motile-island ] ++ envLibs;

  shellHook = ''
    export LD_LIBRARY_PATH="${makeLibraryPath envLibs}:$LD_LIBRARY_PATH";
  '';

}
