let
  nixpkgs = import <nixpkgs> {};

  pkgs = import nixpkgs.path { overlays = [ (self: super: rec {
    mysql-jdbc = nixpkgs.callPackage ./mysql-jdbc { };
    postgresql-jdbc = nixpkgs.callPackage ./postgresql-jdbc { };
    redshift-jdbc = nixpkgs.callPackage ./redshift-jdbc { };
    sql-workbench = nixpkgs.callPackage ./sql-workbench.nix {
      inherit mysql-jdbc postgresql-jdbc redshift-jdbc;
      inherit (nixpkgs) stdenv fetchurl jre unzip;
    };
  })];};

in with pkgs;

stdenv.mkDerivation rec {
  name = "sql-workbench";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    sql-workbench
  ];
}
