{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, fetchFromGitHub ? pkgs.fetchFromGitHub
, alsaLib ? pkgs.alsaLib
, fontconfig ? pkgs.fontconfig
, freettype ? pkgs.freetype
, SDL2 ? pkgs.SDL2
, SDL2_ttf ? pkgs.SDL2_ttf
, xorg ? pkgs.xorg
, qt5 ? pkgs.qt5
, python27 ? pkgs.python27
, pkgconfig ? pkgs.pkgconfig
, mesa ? pkgs.mesa
}:

stdenv.mkDerivation rec {
  name = "mame-${version}";
  version = builtins.substring 0 7 src.rev;

  src = fetchFromGitHub {
    owner = "mamedev";
    repo = "mame";
    rev = "e44e85b8efa23947b8084dba8e02d1aa45a405d2";
    sha256 = "18yip6cgmfdv6fqvskb4j93camnjcv0if2zdvpasw0bac3fh22xm";
  };

  buildInputs = [
    mesa
    python27
    pkgconfig
    alsaLib
    fontconfig
    freettype
    SDL2
    SDL2_ttf
    xorg.libX11
    xorg.libXinerama
    qt5.qtbase.dev
  ];

  makeFlags = [
    "QT_HOME=${qt5.qtbase.dev}"
    "-j5"
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp mame* $out/bin/
  '';
}
