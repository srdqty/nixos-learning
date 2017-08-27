let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: {
    aseprite = nixpkgs.callPackage ./aseprite.nix { };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "aseprite-test";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    aseprite
  ];
}
