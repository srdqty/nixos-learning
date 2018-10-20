let
  pkgs = import <nixpkgs> {};

  cc65-drv = pkgs.fetchgit {
    url = "https://github.com/srdqty/nixos-sandbox";
    rev = "3c385d84a1e44eb12e85966b52e044b28b02a739";
    sha256 = "0kwk5058pw4py6ycdhgdpicnqac2xr0qmq78vigzhyh03985wpx9";
    fetchSubmodules = false;
  };

in
  pkgs.callPackage "${cc65-drv}/cc65" {}
