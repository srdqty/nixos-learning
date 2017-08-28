let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: rec {
    kubectl= nixpkgs.callPackage ./kubectl.nix { };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "kubectl-test";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    kubectl
  ];
}
