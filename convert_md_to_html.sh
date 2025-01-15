#!/bin/bash

# Define the root directory
ROOT_DIR="$PWD/docs"

# Loop through all .md files in the root directory and its subdirectories
find "$ROOT_DIR" -type f -name "*.md" | while read -r md_file; do
    # Get the directory and filename without the .md extension
    output_dir=$(dirname "$md_file")
    output_file="$output_dir/$(basename "$md_file" .md).html"

    # Convert the .md file to .html using pandoc
    pandoc "$md_file" -o "$output_file"

    # Print the converted file path
    echo "Converted: $md_file -> $output_file"
done
