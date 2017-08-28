# The releases of this project are apparently precompiled to .jar files.

{ stdenv
, fetchurl
}:

stdenv.mkDerivation rec {
  name = "mysql-connector-java-${version}";
  version = "5.1.43";

  src = fetchurl {
    url = "https://dev.mysql.com/get/Downloads/Connector-J/${name}.tar.gz";
    sha256 = "1gfiw5r4llbpgbwnkschnrn11cqplb5255dglfm6s5c7rv8d19vg";
  };

  builder = ./builder.sh;

  meta = {
    platforms = stdenv.lib.platforms.unix;
  };
}
