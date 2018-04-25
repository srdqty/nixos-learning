{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, fetchFromGitHub ? pkgs.fetchFromGitHub
, cmake ? pkgs.cmake
}:

stdenv.mkDerivation {
  name = "emsdk";

  buildInputs = [
    cmake
  ];

  src = fetchFromGitHub {
    owner = "juj";
    repo = "emsdk";
    rev = "72f6f67ade54a33cb4486d6b5af2077367161e73";
    sha256 = "0y2p2qqxfnck22icyf32967jlwaq1mjfyhf8kaydhz2qh63x8ix2";
  };

  buildPhase = ''
    ./emsdk update-tags
  '';

  #makeFlags = [ "PREFIX=$(out)" ];
}
