let
  pkgs = import <nixpkgs> {};
in

{ stdenv ? pkgs.stdenv
, fetchurl ? pkgs.fetchurl
, gmp ? pkgs.gmp
}:
let
  dynamic-linker = "${stdenv.glibc.out}/lib/ld-linux-x86-64.so.2";
in
stdenv.mkDerivation rec {
  name = "mlton-${version}";
  version = "20180207";

  src = if stdenv.system == "x86_64-linux" then (fetchurl {
    url = "https://github.com/MLton/mlton/releases/download/on-${version}-release/${name}-1.amd64-linux.tgz";
    sha256 = "0f4q575yfm5dpg4a2wsnqn4l2zrar96p6rlsk0dw10ggyfwvsjlf";
    })
  else if stdenv.system == "x86_64-darwin" then (fetchurl {
    url = "https://github.com/MLton/mlton/releases/download/on-${version}-release/${name}-1.amd64-darwin.gmp-static.tgz";
      sha256 = "1cw7yhw48qp12q0adwf8srpjzrgkp84kmlkqw3pz8vkxz4p9hbdv";
    })
  else
    throw "Architecture not supported";

  buildPhase = ''
    make update \
      CC="$(type -p cc)" \
      WITH_GMP_INC_DIR="${gmp.dev}/include" \
      WITH_GMP_LIB_DIR="${gmp}/lib"
  '';

  installPhase = ''
    make install PREFIX=$out
  '';

  postFixup = stdenv.lib.optionalString stdenv.isLinux ''
    patchelf --set-interpreter ${dynamic-linker} $out/lib/mlton/mlton-compile
    patchelf --set-rpath ${gmp}/lib $out/lib/mlton/mlton-compile

    for e in mllex mlnlffigen mlprof mlyacc; do
      patchelf --set-interpreter ${dynamic-linker} $out/bin/$e
      patchelf --set-rpath ${gmp}/lib $out/bin/$e
    done
  '' + stdenv.lib.optionalString stdenv.isDarwin ''
    install_name_tool -change \
      /opt/local/lib/libgmp.10.dylib \
      ${gmp}/lib/libgmp.10.dylib \
      $out/lib/mlton/mlton-compile

    for e in mllex mlnlffigen mlprof mlyacc; do
      install_name_tool -change \
        /opt/local/lib/libgmp.10.dylib \
        ${gmp}/lib/libgmp.10.dylib \
        $out/bin/$e
    done
  '';
}
