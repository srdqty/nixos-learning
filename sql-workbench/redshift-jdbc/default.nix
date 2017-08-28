{ stdenv
, fetchurl
}:

stdenv.mkDerivation rec {
  name = "RedshiftJDBC42-${version}";
  version = "1.2.7.1003";

  src = fetchurl {
    url = "https://s3.amazonaws.com/redshift-downloads/drivers/${name}.jar";
    sha256 = "1v4nnkl6pml98i0j0lr6w607v3p77vybaqmj7amjh1d3dj16xgsi";
  };

  builder = ./builder.sh;

  meta = {
    platforms = stdenv.lib.platforms.unix;
  };
}
