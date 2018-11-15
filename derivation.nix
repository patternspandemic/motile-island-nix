# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Hitch up libs to racket? Motile/Island source...

{ stdenv
, curl
, czmq
, libfastlz
, libsodium
, racket
, zeromq
, zyre
}:

let
  inherit (stdenv.lib) makeLibraryPath;
  envLibs = [
    curl
    czmq
    libfastlz
    libsodium
    zeromq
    zyre
  ];
in

stdenv.mkDerivation {
  name = "motile-island-env";
  buildInputs = [ racket ] ++ envLibs;

  shellHook = ''
    export LD_LIBRARY_PATH="${makeLibraryPath envLibs}:$LD_LIBRARY_PATH";
  '';

}
