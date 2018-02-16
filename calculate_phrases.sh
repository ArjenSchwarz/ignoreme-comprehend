#!/bin/bash
# Calculates the key phrase analysis, both combined and each year separately, for
# the files in the provided source path.
# Output is printed as a json array
# Arguments:
#   - source path (required)
source_path=${1}
source_search="${source_path}/*.phrases"
source_2016="${source_path}/2016*.phrases"
source_2017="${source_path}/2017*.phrases"
source_2018="${source_path}/2018*.phrases"

total_query="[[.[] | .KeyPhrases] | flatten | .[]] | length"

echo "Combined results:"
TOTAL=$(cat $source_search | jq -s "${total_query}")
cat $source_search | jq --arg TOTAL $TOTAL -s -f phrases.jq

echo "2016 results:"
TOTAL=$(cat $source_2016 | jq -s "${total_query}")
cat $source_2016 | jq --arg TOTAL $TOTAL -s -f phrases.jq

echo "2017 results:"
TOTAL=$(cat $source_2017 |  jq -s "${total_query}")
cat $source_2017 | jq --arg TOTAL $TOTAL -s -f phrases.jq

echo "2018 results:"
TOTAL=$(cat $source_2018 |  jq -s "${total_query}")
cat $source_2018 | jq --arg TOTAL $TOTAL -s -f phrases.jq
