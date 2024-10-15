#!/bin/zsh

# Remove the old build files
rm -rf ./build/* \

# Remove the compressed file, if exists
rm -rf ./LXGWBright.7z \

# Remove the old source font files, if exists
rm -rf ./LXGWBright \

# Download the latest version of the font
curl -L -O https://github.com/lxgw/LxgwBright/releases/latest/download/LXGWBright.7z && \

# Extract the font
7z x LXGWBright.7z && \

# Split all the fonts
for file in ./LXGWBright/*.ttf; do
    dir_name=$(basename "$file" .ttf)
    cn-font-split --testHTML=false --chunkSize=$((60*1024)) -i="$file" -o="./build/$dir_name"
done && \

# example script
# cn-font-split --testHTML=false --chunkSize=$((60*1024)) -i=./LXGWBright/LXGWBright-Light.ttf -o=./build/LXGWBright-Light
# cn-font-split --testHTML=false --chunkSize=$((60*1024)) -i=./LXGWBright/LXGWBright-Regular.ttf -o=./build/LXGWBright-Regular

# Clean up
rm -rf ./LXGWBright.7z \
rm -rf ./LXGWBright
