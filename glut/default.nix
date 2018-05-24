{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, freeglut ? pkgs.freeglut
, mesa ? pkgs.mesa
}:

stdenv.mkDerivation rec {
  name = "freeglut-demo";

  src = ./.;

  buildInputs = [
    freeglut
    mesa
  ];

  makeFlags = [ "PREFIX=$(out)" ];
}
