#!/bin/bash
# Calculates the sentiment analysis, both combined and each year separately, for
# the files in the provided source path.
# Output is printed as a json array
# Arguments:
#   - source path (required)
source_path=${1}
source_search="${source_path}/*.sentiment"
source_2016="${source_path}/2016*.sentiment"
source_2017="${source_path}/2017*.sentiment"
source_2018="${source_path}/2018*.sentiment"

total_query=". | length"

echo "Combined results:"
TOTAL=$(cat $source_search | jq -s "${total_query}")
cat $source_search | jq --arg TOTAL $TOTAL -s -f sentiment.jq

echo "2016 results:"
TOTAL=$(cat $source_2016 | jq -s "${total_query}")
cat $source_2016 | jq --arg TOTAL $TOTAL -s -f sentiment.jq

echo "2017 results:"
TOTAL=$(cat $source_2017 | jq -s "${total_query}")
cat $source_2017 | jq --arg TOTAL $TOTAL -s -f sentiment.jq

echo "2018 results:"
TOTAL=$(cat $source_2018 | jq -s "${total_query}")
cat $source_2018 | jq --arg TOTAL $TOTAL -s -f sentiment.jq
