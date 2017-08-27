with (import <nixpkgs> {});

stdenv.mkDerivation rec {
  name = "pws-1.0.6";

  env = bundlerEnv {
    name = "pws-1.0.6-gems";

    ruby = ruby_2_1;

    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };

  buildInputs = [ makeWrapper ];

  phases = ["installPhase"];

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${env}/bin/pws $out/bin/pws
  '';
}
