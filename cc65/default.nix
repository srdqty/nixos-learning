{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  name = "cc65";

  src = fetchFromGitHub {
    owner = "cc65";
    repo = "cc65";
    rev = "d348d82d5a53161b8a8d1f03ee7f0d3cd2c38f07";
    sha256 = "1d8v007fp7ac8rxrbr9psvspqhxm8ar9cj6pp03m5nfbsy4bpdlk";
  };

  makeFlags = [ "PREFIX=$(out)" ];
}
