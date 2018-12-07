
{}:

let
  ovrly = self: super: {
    coast-czmq = super.callPackage ./czmq.nix {};
    coast-libfastlz = super.callPackage ./fastlz.nix {};
    coast-libsodium = super.callPackage ./libsodium.nix {};
    coast-motile-island = super.callPackage ./motile-island.nix {};
    coast-zeromq = super.callPackage ./zeromq.nix {};
    coast-zyre = super.callPackage ./zyre.nix {};
    motile-island-env = super.callPackage ./derivation.nix {};
  };
in
  ovrly
