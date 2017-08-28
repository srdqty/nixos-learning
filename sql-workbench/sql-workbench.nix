{ stdenv
, fetchurl
, jre
, unzip
, mysql-jdbc
, postgresql-jdbc
, redshift-jdbc
}:

stdenv.mkDerivation rec {
  name = "sql-workbench-${version}";
  version = "122";

  src = fetchurl {
    url = "http://www.sql-workbench.net/Workbench-Build${version}.zip";
    sha256 = "1g0ifccny5nkdm9miidg05gaz5gh8n7xcsfyz80asirggcr41bl4";
  };

  nativeBuildInputs = [
    mysql-jdbc
    postgresql-jdbc
    redshift-jdbc
    unzip
  ];

  unpackCmd = "unzip -d ${name} $curSrc";
  sourceRoot = "${name}";

  installPhase = ''
    mkdir -p "$out/bin";
    mkdir -p "$out/share";

    install -D -m444 -T sqlworkbench.jar "$out/share/sql-workbench.jar"

    echo "#!/bin/sh" > "$out/bin/sql-workbench"
    echo "${jre}/bin/java -Xmx1024m -jar \"$out/share/sql-workbench.jar\"" >> "$out/bin/sql-workbench"

    chmod +x "$out/bin/sql-workbench"
  '';

  postBuild = ''
    mkdir -p "$out/share/drivers";
    cp ${mysql-jdbc}/share/*.jar "$out/share/drivers/"
    cp ${postgresql-jdbc}/share/*.jar "$out/share/drivers/"
    cp ${redshift-jdbc}/share/*.jar "$out/share/drivers/"
  '';

  meta = {
    homepage = http://www.sql-workbench.net/;
    description = "Free, DBMS-independent, cross-platform SQL query tool";
    longDescription = ''
      MySQL, Postgresql, and Redshift drivers can be found in the
      $(nix-env -q --out-path sql-workbench-122)/share/drivers directory
    '';
    license = {
      fullName = "Modified Apache License, Version 2.0";
      url = http://www.sql-workbench.net/manual/license.html;
    };
    platforms = stdenv.lib.platforms.unix;
  };
}
