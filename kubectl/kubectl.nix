{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kubectl-${version}";
  version = "v1.5.7";

  src = fetchurl {
    url = "https://storage.googleapis.com/kubernetes-release/release/${version}/bin/linux/amd64/kubectl";
    sha256 = "1g0qzyn1ijfs1khh5qs6wvyq832y2779sr4b35i92fhaa1xcq5z4";
  };

  unpackPhase = "true";

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    exe=$out/bin/kubectl

    mkdir -p $out/bin
    install -D -m555 -T ${src} $exe

    mkdir -p $out/share/bash-completion/completions
    cmp=$out/share/bash-completion/completions/kubectl
    $exe completion bash > $cmp
  '';
    # TODO: figure out how to make executables with suffixes work with bash
    # completion
    #    sed -i 's/__start_kubectl kubectl/__start_kubectl ${name}/g' $cmp
    #    sed -i 's/$(kubectl/$(${name}/g' $cmp
    #    sed -i 's/"kubectl"/"${name}"/g' $cmp

  meta = {
    platforms = stdenv.lib.platforms.unix;
  };
}
