# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Meta, Support darwin

{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  name = "libfastlz";

  src = fetchFromGitHub {
    owner = "ariya";
    repo = "FastLZ";
    rev = "f1217348a868bdb9ee0730244475aee05ab329c5";
    sha256 = "19vm1sqrnvczh0z0qf3im3vp9v5lqxl3jhshpn4ldvwsz9zi36ph";
  };

  buildPhase = ''
    ${stdenv.cc}/bin/gcc -fPIC -O3 -fomit-frame-pointer -shared -o libfastlz.so fastlz.c
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp libfastlz.so $out/lib
  '';
}
