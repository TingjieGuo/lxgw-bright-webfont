#!/bin/zsh

# Remove the old build files
rm -rf ./build/* \

# Remove the compressed file, if exists
rm -rf ./*.7z \

# Remove the old source font files, if exists
rm -rf ./LXGWBright* \

# Download the latest version of the font
curl -L -O https://github.com/lxgw/LxgwBright/releases/latest/download/LXGWBright.7z && \
curl -L -O https://github.com/lxgw/LxgwBright/releases/latest/download/LXGWBrightGB.7z && \
curl -L -O https://github.com/lxgw/LxgwBright/releases/latest/download/LXGWBrightTC.7z && \


# Extract the font
7z x LXGWBright.7z && \
7z x LXGWBrightGB.7z && \
7z x LXGWBrightTC.7z && \

# Split all the fonts
for file in ./LXGWBright*/*.ttf; do
    dir_name=$(basename "$file" .ttf)
    cn-font-split -i="$file" -o="./build/$dir_name" --testHTML=false --chunkSize=$((50*1024)) 
done && \

# example script
# cn-font-split -i=./LXGWBrightGB/LXGWBrightGB-Regular.ttf -o=./build/LXGWBrightGB-Regular_test --testHTML=false --chunkSize=$((60*1024)) --subsets='["U+4E00-U+9FFF"]'

# Clean up
rm -rf ./LXGWBright*.7z \
rm -rf ./LXGWBright*
