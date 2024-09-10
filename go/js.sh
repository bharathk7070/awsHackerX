#!/bin/bash

# File containing URLs
URL_FILE="js.txt"

# Check if the file exists
if [ ! -f "$URL_FILE" ]; then
    echo "File not found!"
    exit 1
fi

# Create a directory to save the downloaded files
mkdir -p js_files

# Read each line in the file and download the JavaScript files
while IFS= read -r url; do
    # Check if the URL is not empty
    if [ -n "$url" ]; then
        echo "Downloading $url..."
        wget -P js_files "$url"
    fi
done < "$URL_FILE"

echo "Download complete."

