let
  pkgs = import <nixpkgs> {};
in

{ version, rev, sha256, owner ? "mlton", repo ? "mlton" }:

{ mltonBootstrap ? import ./20180207-binary.nix {}
, stdenv ? pkgs.stdenv
, fetchFromGitHub ? pkgs.fetchFromGitHub
, gmp ? pkgs.gmp
}:
stdenv.mkDerivation {
  name = "mlton-${version}";

  src = fetchFromGitHub {
    owner = "mlton";
    repo = "mlton";
    rev = "${rev}";
    sha256 = "${sha256}";
  };

  buildInputs = [mltonBootstrap gmp];

  preBuild = ''
    makeFlagsArray=(
      MLTON_VERSION="${version} ${rev}"
      CC="$(type -p cc)"
      PREFIX="$out"
      WITH_GMP_INC_DIR="${gmp.dev}/include"
      WITH_GMP_LIB_DIR="${gmp}/lib"
      )
  '';

  doCheck = true;
}
