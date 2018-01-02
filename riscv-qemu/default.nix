{ stdenv
, fetchFromGitHub

#, autoconf
#, gettext
#, glib
#, libaio
#, pkgconfig
#, python2
#, SDL

, alsaLib
, glib
, libaio
, libpulseaudio
, perl
, pixman
, pkgconfig
, python2
, SDL
, zlib
}:
# sudo apt-get install
# gcc
# libc6-dev
# bridge-utils
# uml-utilities
# zlib1g-dev
# autoconf
# automake
# libtool


stdenv.mkDerivation {
  name = "qemu-riscv";

  src = fetchFromGitHub {
    owner = "riscv";
    repo = "riscv-qemu";
    rev = "701f712651df28355e09150d2af30d469d92f4ed";
    sha256 = "0y7g65s6rxx3zwcpyk09y7gfz90g2q0044bq6zix3wk2j4lzmdvd";
    fetchSubmodules = true;
  };

  buildInputs = [
    alsaLib
    glib
    libaio
    libpulseaudio
    perl
    pixman
    pkgconfig
    python2
    SDL
    zlib
  ];

  #  buildInputs = [
  #    alsaLib glib libaio libpulseaudio perl pixman pkgconfig python2 SDL zlib
  #  ];
  #
  hardeningDisable = [ "stackprotector" ];
  #
  configureFlags = [
    "--smbd=smbd"
    "--sysconfdir=/etc"
    "--localstatedir=/var"
    "--target-list=riscv64-softmmu,riscv32-softmmu"
    "--enable-linux-aio"
    "--audio-drv-list=alsa,pa,sdl"
  ];
}
