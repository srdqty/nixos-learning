with (import <nixpkgs> {});

derivation {
  name = "simple2";
  builder = "${bash}/bin/bash";
  args = [ ./simple_builder.sh ];
  inherit gcc;
  inherit coreutils;
  src = ./simple.c;
  system = builtins.currentSystem;
}
