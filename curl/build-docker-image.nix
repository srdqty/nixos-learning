let
  pkgs = import <nixpkgs> {};
  project-root = builtins.toString ./.;
in with pkgs;

stdenv.mkDerivation rec {
  name = "build-docker-image";

  shellHook = ''
    set -eu

    nix-build '${project-root}/default.nix' \
      --out-link '${project-root}/docker-image.tar.gz'

    docker load -i '${project-root}/docker-image.tar.gz'

    exit
  '';
}
