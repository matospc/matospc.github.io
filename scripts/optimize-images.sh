#!/bin/sh

# PNG optimization with zopflipng.
find . -type f -name "*.png" -exec zopflipng -y {} {} \; 

### https://ariya.io/2016/06/using-zopfli-to-optimize-png-images

# PNG conversion to WebP
#find . -type f -name "*.png" -exec cwebp -lossless {} -o {}.webp \; 

# Rename all *.png.webp to *.webp
#find . -name "*.png.webp" -exec rename 's/\.png.webp$/.webp/' '{}' \;

# JPG conversion to WebP
find . -type f -name "*.jpg" -exec cwebp -q 90 {} -o {}.webp \; 

# Rename all *.jpg.webp to *.webp
find . -name "*.jpg.webp" -exec rename -f 's/\.jpg.webp$/.webp/' '{}' \;
