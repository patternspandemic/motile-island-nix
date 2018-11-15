
{}:

let
  ovrly = self: super: {
    libfastlz = super.callPackage ./fastlz.nix {};
    motile-island-env = super.callPackage ./derivation.nix {};
    zyre = super.callPackage ./zyre.nix {};
  };
in
  ovrly
