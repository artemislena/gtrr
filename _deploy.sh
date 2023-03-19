#!/bin/sh

# Deploy site to server

umask 022

cobalt build && (
    find _site -name '*.css' -exec css-html-js-minify --quiet --overwrite {} \; && echo 'CSS minified.'

    # Append hashes as query parameters to the paths in /static
    echo 'Calculating and appending hashes…'
    find static -type d -exec mkdir -p _metadata/{} \; >/dev/null
    find static -type f -exec sh -c 'xxh32sum {} | cut -d " " -f 1 > _metadata/{}' \;
    find _site -name '*.html' -exec ./_append-hashes.sh {} \;

    echo 'Precompressing…'
    find _site/static -type f '!' -regex '.*\.(png|zip|7z|jpeg|webp|br|zst|gz)' -exec zstd -q {} \; -exec gzip -k {} \; -exec brotli {} \;

    chmod -R a+rX _site

    echo 'Touch YubiKey'
    rsync -r --progress --del _site/ http:/srv/www/gtrr/

    rm -r _site/ && echo 'Build files removed.'
)
