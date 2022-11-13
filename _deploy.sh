#!/bin/sh

# Deploy site to server

cobalt build

find _site -name '*.css' -exec css-html-js-minify --quiet --overwrite {} \; && echo 'CSS minified.'

# Append hashes as query parameters to the paths in /static
echo 'Calculating and appending hashes…'
find static -type d -exec mkdir -p _metadata/{} \; >/dev/null
find static -type f -exec sh -c 'crc32 {} > _metadata/{}' \;
find _site -name '*.html' -exec ./_append-hashes.sh {} \;

# Ensure correct permissions
find _site -type f -exec chmod 644 {} \;
find _site -type d -exec chmod 755 {} \;

echo 'Touch YubiKey'
rsync -a --progress --delete _site/ http:/srv/www/gtrr/

rm -r _site/ && echo 'Build files removed.'
