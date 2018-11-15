# nixpkgs compatible derivation, ready to be used via `callPackage` and PR'd.

# TODO: Meta

{ stdenv
, fetchFromGitHub
, racket
}:

stdenv.mkDerivation {
  name = "motile-island";

  src = fetchFromGitHub {
    owner = "karinies";
    repo = "coast";
    rev = "b520003d9c4ebb2775db2f07688e58bbd3199195";
    sha256 = "0mqqy00gn396xb0v3qdzx713180z6xm87gll9p5afa0xgvr86n0k";
  };

  nativeBuildInputs = [ racket ];

  buildPhase = ''
    rm -r libs
    rm -r zeromq
    substituteInPlace ./bindings/libsodium/sodium.rkt \
      --replace "/usr/local/lib/libsodium" "libsodium"
    substituteInPlace ./bindings/fastlz/fastlz.rkt \
      --replace "/usr/local/lib/libfastlz" "libfastlz"
    make raco-make
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out
  '';
}
