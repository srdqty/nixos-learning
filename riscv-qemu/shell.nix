let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: {
    riscv-qemu = nixpkgs.callPackage ./default.nix { };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "riscv-qemu-test";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    riscv-qemu
  ];
}
