{ stdenv
, fetchurl
}:

stdenv.mkDerivation rec {
  name = "postgresql-${version}";
  version = "42.1.4";

  src = fetchurl {
    url = "https://jdbc.postgresql.org/download/${name}.jar";
    sha256 = "0dbp5419hg89vfar22kpc5jy1v3v2hm99w7r3lp7cpi4x4rfs8s5";
  };

  builder = ./builder.sh;

  meta = {
    platforms = stdenv.lib.platforms.unix;
  };
}
