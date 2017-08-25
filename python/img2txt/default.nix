let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: {
    img2txt = nixpkgs.callPackage ./img2txt.nix {
      inherit (nixpkgs) fetchFromGitHub licenses;
      inherit (nixpkgs.pythonPackages) buildPythonPackage docopt pillow;
    };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "img2txt-test";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    img2txt
  ];
}
