let
  pkgs = import <nixpkgs> {};
  x = pkgs.callPackage ./default.nix {};
in
pkgs.stdenv.mkDerivation {
  name = "shell";
  buildInputs = [x];
}
