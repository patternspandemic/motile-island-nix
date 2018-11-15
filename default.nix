
{ pkg ? "motile-island-env" }:

let
  nixpkgs = import ./nixpkgs.nix;
  pkgs = nixpkgs {
    config = {};
    overlays = [
      (import ./overlay.nix {})
    ];
  };

in pkgs.${pkg}
