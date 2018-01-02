let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: {
    cc65 = nixpkgs.callPackage ./default.nix { };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "cc65-test";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    cc65
  ];
}
