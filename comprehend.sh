#!/bin/bash
# Runs the 3 AWS Comprehend APIs on all the files in the provided source path
# APIs run: detect-entities, detect-key-phrases, detect-sentiment
# Arguments:
#   - source path (required)
#   - destination path (required)

source_path=${1}
destination_path=${2}

for filename in ${source_path}/*; do
    stripped_filename=$(basename ${filename})
    filesize=$(wc -c < ${filename})
    if [[ ${filesize} -gt 5000 ]]; then
      continue
    fi
    echo "Evaluating ${stripped_filename}"
    aws comprehend detect-entities --language-code en --text "$(cat ${filename})" > $destination_path/${stripped_filename}.entities
    aws comprehend detect-key-phrases --language-code en --text "$(cat ${filename})" > $destination_path/${stripped_filename}.phrases
    aws comprehend detect-sentiment --language-code en --text "$(cat ${filename})" > $destination_path/${stripped_filename}.sentiment
done
