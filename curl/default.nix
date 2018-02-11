let
  pkgs = import <nixpkgs> {};
in
  pkgs.dockerTools.buildImage {
    name = "curl-from-docker";

    tag = "latest";

    contents = [
      pkgs.curl
    ];

    config.Env = [
      "CURL_CA_BUNDLE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
  }
