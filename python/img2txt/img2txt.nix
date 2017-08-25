{ buildPythonPackage
, fetchFromGitHub
, docopt
, pillow
, licenses
}:

buildPythonPackage rec {
  name = "img2txt-${version}";
  version = builtins.substring 0 7 src.rev;

  src = fetchFromGitHub {
    owner = "hit9";
    repo = "img2txt";
    rev = "680e51cbf2e39c8c8a91e80133dfe0bd7ad9bdf8";
    sha256 = "0wpng7mlkm81qq0z2fxx6i0kgqszw8q26nbmf6l6nzmia9p29804";
  };

  buildInputs = [docopt pillow];
  propagatedBuildInputs = buildInputs;

  # The docopt docstring must be the first thing in the python script, so we'll
  # manually fix up the wrapper script.
  postFixup = ''
    head -5 $out/bin/.img2txt.py-wrapped > temp.py
    sed -n '7,31p' $out/bin/.img2txt.py-wrapped >> temp.py
    sed -n '6p' $out/bin/.img2txt.py-wrapped >> temp.py
    tail +32 $out/bin/.img2txt.py-wrapped >> temp.py

    chmod --reference $out/bin/.img2txt.py-wrapped temp.py
    chown --reference $out/bin/.img2txt.py-wrapped temp.py

    mv -f temp.py $out/bin/.img2txt.py-wrapped
  '';

  meta = {
    homepage = "https://github.com/hit9/img2txt";
    description = "Image to Ascii Text with color support, can output to html or ansi terminal.";
    license = licenses.bsd3;
  };
}
