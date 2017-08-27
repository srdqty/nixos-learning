with (import <nixpkgs> {});

stdenv.mkDerivation rec {
  name = "scrypt-test";

  env = bundlerEnv {
    name = "scrypt-test";

    ruby = ruby_2_1;

    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
}
