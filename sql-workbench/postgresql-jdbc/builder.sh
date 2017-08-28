source "${stdenv}/setup"

set -e

echo "out: $out"
echo "src: $src"

install -T -D -m444 "${src}" "${out}/share/postgresql-jdbc.jar"
