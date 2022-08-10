#!/bin/sh

find static -type f -exec sh -c "sed -i '' 's@{}@{}\?h='\$(cat _metadata/{})'@' '$1'" \;
