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
curl -L -O https://github.com/lxgw/LxgwBright-Code/releases/latest/download/LxgwBrightCode.7z && \
curl -L -O https://github.com/lxgw/LxgwNeoZhiSong/releases/latest/download/LXGWNeoZhiSongPlus.ttf && \


# Extract the font
7z x LXGWBright.7z && \
7z x LXGWBrightGB.7z && \
7z x LXGWBrightTC.7z && \
7z x LxgwBrightCode.7z && \

# Split all the fonts
for file in ./LXGW*/*.ttf; do
# find . -type f -iname 'lxgwbright*.ttf' | while read -r file; do
    dir_name=$(basename "$file" .ttf)
    cn-font-split -i "$file" -o "./build/$dir_name" --testHtml false --chunkSize $((50*1024)) 
done && \

for file in ./Lxgw*/*.ttf; do
# find . -type f -iname 'lxgwbright*.ttf' | while read -r file; do
    dir_name=$(basename "$file" .ttf)
    cn-font-split -i "$file" -o "./build/$dir_name" --testHtml false --chunkSize $((50*1024)) 
done && \

cn-font-split -i "./LXGWNeoZhiSongPlus.ttf" -o "./build/LXGWNeoZhiSongPlus" --testHtml false --chunkSize $((50*1024))

# example script
# cn-font-split -i "./LXGWBrightGB/LXGWBrightGB-Regular.ttf" -o "./build/LXGWBrightGB-Regular_test" --testHtml false --chunkSize $((60*1024)) --subsets "["U+4E00-U+9FFF"]"

# Clean up
# rm -rf ./LXGWBright*.7z \
# rm -rf ./LXGWBright*

find . -maxdepth 1 -iname 'lxgw*' -exec rm -rf {} +
