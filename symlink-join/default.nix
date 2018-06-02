let
  pkgs = import <nixpkgs> {};
  _pkg1 = pkgs.callPackage ./pkg1 { mkDerivation = pkgs.stdenv.mkDerivation; };
  _pkg2 = pkgs.callPackage ./pkg2 { mkDerivation = pkgs.stdenv.mkDerivation; };
in
{ ats2 ? pkgs.ats2
, symlinkJoin  ? pkgs.symlinkJoin
, makeWrapper ? pkgs.makeWrapper
, packages ? [_pkg1 _pkg2]
}:
symlinkJoin rec {
  name = "pkg1-and-pkg2";
  version = pkgs.ats2.version;

  paths = packages ++ [ats2];

  postBuild = ''
    rm -f $out/nix-support/setup-hook
    echo "export PATSHOME=$out/lib/ats2-postiats-${version}" >> \
      $out/nix-support/setup-hook
  '';
}
