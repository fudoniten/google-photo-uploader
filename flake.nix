{
  description = "Google Photo Uploader";

  inputs = { gomod2nix.url = "github:nix-community/gomod2nix"; };

  outputs = { self, gomod2nix, ... }: {
    packages = rec {
      default = google-photo-uploader;
      google-photo-uploader =
        import ./google-photo-uploader.nix { inherit gomod2nix; };
    };
  };
}
