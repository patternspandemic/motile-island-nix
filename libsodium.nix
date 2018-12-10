{ stdenv
, autoreconfHook
, pkgconfig
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  name = "libsodium-0.4.5";

  # src = fetchFromGitHub {
  #   owner = "jedisct1";
  #   repo = "libsodium";
  #   rev = "5f8800bfa076e6d9556bd5a4e4bdb2a7047876d2";
  #   sha256 = "1fjvbrwnr3315c3f2y7z7cwk5by4xxhk653a10gpj00ip84jygih";
  # };
  src = ../coast2/zeromq/libsodium-0.4.5; # LOL, use COAST's vendored & altered version

  nativeBuildInputs = [ autoreconfHook pkgconfig ];
  outputs = [ "out" "dev" ];
  separateDebugInfo = stdenv.isLinux;

  enableParallelBuilding = true;

  doCheck = true;
}