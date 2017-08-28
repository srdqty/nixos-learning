source "${stdenv}/setup"

set -e

tar xzf "${src}"
cd "${name}"

install -T -D -m444 "${name}-bin.jar" "${out}/share/mysql-jdbc.jar"
