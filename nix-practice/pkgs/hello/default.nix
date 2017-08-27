with (import <nixpkgs> {});

stdenv.mkDerivation rec {
  name = "hello-2.9";
  builder = ./builder.sh;

  src = fetchurl {
    url = "mirror://gnu/hello/${name}.tar.gz";
    sha256 = "19qy37gkasc4csb1d3bdiz9snn8mir2p3aj0jgzmfv0r2hi7mfzc";
  };
}
