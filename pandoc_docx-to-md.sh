# !/usr/bin/env bash

# Convert Microsoft's docx to Markdown for blog posts.
hello_world="Hello, fellow lovely people :3"


input_format=".docx"
output_format=".md"

subdirectory="_conversion_Markdown"

finished_conversion="Finished converting. Enjoy your day :3"

mkdir_conversion() {
    mkdir -p $subdirectory
}

convert_command() {
    echo "Running conversion"
    find . -name \*.docx -type f -exec pandoc -o $subdirectory/{}.md {} \;
}

mkdir_conversion
convert_command

echo $finished_conversion