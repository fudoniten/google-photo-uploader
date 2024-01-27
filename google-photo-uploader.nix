{ nixpkgs, buildGoApplication, ... }:

with nixpkgs.lib;
buildGoApplication rec {
  pname = "google-photo-uploader";
  version = "1.6.1";

  src = nixpkgs.fetchFromGitHub {
    owner = "int128";
    repo = "gpup";
    rev = version;
    sha256 = "sha256-FfJbWpH//Z/NxgpH7JvOf8pWxJOxgYDABUfcyWNps30=";
  };

  modules = ./gomod2nix.toml;

  meta = with nixpkgs.lib; {
    description = "Google photos uploader, written in Go.";
    homepage = "https://github.com/int128/gpup";
    license = licenses.asl20;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
