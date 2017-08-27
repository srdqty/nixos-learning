{ stdenv, fetchFromGitHub, cmake, pkgconfig, ninja
, libX11, libXext, libXcursor, libXpm, libXxf86vm, libXxf86dga
}:

stdenv.mkDerivation rec {
  name = "aseprite${version}";
  version = builtins.substring 0 7 src.rev;

  src = fetchFromGitHub {
    owner = "aseprite";
    repo = "aseprite";
    rev = "cf3814bc201dade41b7336e3a37e812b9fddd55e";
    sha256 = "18smczxzlll1qlnjgyvwkfw2w7l9bqidwznl54cym3lld71kbq39";
    fetchSubmodules = true;
  };

  buildInputs = [
    cmake pkgconfig ninja
    libX11 libXext libXcursor libXpm libXxf86vm libXxf86dga
  ];

  cmakeFlags = ''
    -DENABLE_UPDATER=OFF
  '';

  NIX_LDFLAGS = "-lX11";

  meta = {
    description = "Animated sprite editor & pixel art tool";
    homepage = https://www.aseprite.org/;
    license = stdenv.lib.licenses.gpl2Plus;
    platforms = stdenv.lib.platforms.linux;
  };
}
