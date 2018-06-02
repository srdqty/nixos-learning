let
  pkgs = import <nixpkgs> {};
in

{ mkDerivation ? pkgs.stdenv.mkDerivation
, ats2 ? pkgs.ats2
}:

mkDerivation {
  name = "pkg1";

  src = ./.;

  makeFlags = [
    "PREFIX=$(out)"
    "PATSHOME_SUFFIX=lib/ats2-postiats-${ats2.version}"
  ];
}
