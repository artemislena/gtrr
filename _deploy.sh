#!/bin/sh

# Deploy site to server

set -e
umask 022

# Use a temporary directory for build files
TMPDIR="$(mktemp -d)"

# Calculate hashes to append as query parameters to the paths in /static
echo 'Calculating hashes…'
find static -type d -exec mkdir -p _data/hashes/{} \; >/dev/null
# This one replaces "." with "-" and prepends it if filename starts with a digit
find static -type f -not -name '.DS_Store' \
-exec sh -c 'echo "\"$(xxhsum -H0 "$1" | cut -d " " -f 1 | xxd -r -p | base64 | sed s/=//g | tr +/ -_)\"" > "_data/hashes/$(dirname "$1")/$(basename "$1" | cut -c 1 | sed "s/[[:digit:]]/-/" | grep "\-")$(basename "$1" | tr . -).json"' sh {} \;

cobalt build -d "$TMPDIR"

find "$TMPDIR" -name '*.css' -exec css-html-js-minify --quiet --overwrite {} \;
echo 'CSS minified.'

echo 'Precompressing…'
find -E "$TMPDIR" -type f -not '(' -regex '.*\.(png|zip|7z|jpeg|webp|br|gz|zst|html)' -or -size 1 ')' -exec ect -9 -gzip --mt-deflate {} \; -exec brotli {} \;

chmod -R a+rX "$TMPDIR"

echo 'Authenticating to webserver…'
rsync -r --progress --del "$TMPDIR"/ http:/srv/www/gtrr/
