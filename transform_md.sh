#!/bin/bash
# Uses pandoc to transform all Markdown files in a directory to plain text
# Arguments:
#   - source path (required)
#   - destination path (required)

source_path=${1}
destination_path=${2}

for filename in ${source_path}/*.md; do
    stripped_filename=$(basename ${filename})
    pandoc -f markdown -t plain --wrap=none ${filename} -o ${destination_path}/${stripped_filename}
done
