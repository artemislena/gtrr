#!/bin/sh

# Deploy site to server

set -e
umask 022

# Calculate hashes to append as query parameters to the paths in /static
echo 'Calculating hashes…'
find static -type d -exec mkdir -p _data/hashes/{} \; >/dev/null
# This one prepends "-" if filename starts with a digit and replaces "." with "_" in filename (note, echo usage might be shell-specific, see https://stackoverflow.com/questions/44448096/echo-the-character-dash-in-the-unix-command-line)
find static -type f -not -name '.DS_Store' -exec sh -c 'echo "\"$(xxh32sum {} | cut -d " " -f 1)\"" > "_data/hashes/$(dirname {})/$(basename {} | cut -c 1 | grep -q "[0-9]" && echo -)$(basename {} | tr "." "_").json"' \;

cobalt build

find _site -name '*.css' -exec css-html-js-minify --quiet --overwrite {} \;
echo 'CSS minified.'

echo 'Precompressing…'
find -E _site -type f -not -regex '.*\.(png|zip|7z|jpeg|webp|br|zst|gz|html)' -exec zstd -q {} \; -exec gzip -k {} \; -exec brotli {} \;

chmod -R a+rX _site

echo 'Touch YubiKey'
rsync -r --progress --del _site/ http:/srv/www/gtrr/

rm -r _site/ && echo 'Build files removed.'
