{
  description = "Google Photo Uploader";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    gomod2nix.url = "github:nix-community/gomod2nix";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, gomod2nix, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let inherit (gomod2nix.legacyPackages."${system}") buildGoApplication;
      in {
        packages = rec {
          default = google-photo-uploader;
          google-photo-uploader = import ./google-photo-uploader.nix {
            inherit nixpkgs buildGoApplication;
          };
        };
      });
}
