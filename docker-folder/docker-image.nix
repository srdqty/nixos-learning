let
  pkgs = import <nixpkgs> {};

  folder = ./my-folder;
in
  pkgs.dockerTools.buildImage {
    name = "folder-in-docker";
    tag = "latest";

    contents = [
      pkgs.coreutils
      pkgs.bashInteractive
    ];

    runAsRoot = ''
      ln -s ${folder} /my-folder
    '';

    config = {
      Entrypoint = [
        "ls"
      ];
    };
  }
