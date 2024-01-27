{ gomod2nix }:

{ config, lib, pkgs, ... }:

let buildGoApplication = gomod2nix.packages."${pkgs.system}".buildGoApplication;
in buildGoApplication rec {
  pname = "google-photo-uploader";
  version = "1.6.1";

  src = pkgs.fetchFromGitHub {
    owner = "int128";
    repo = "gpup";
    rev = version;
    sha256 = "sha256-FfJbWpH//Z/NxgpH7JvOf8pWxJOxgYDABUfcyWNps30=";
  };

  modules = ./gomod2nix.toml;

  meta = with pkgs.lib; {
    description = "Google photos uploader, written in Go.";
    homepage = "https://github.com/int128/gpup";
    license = licenses.asl20;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
