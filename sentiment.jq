# jq query for entities calculation
. | group_by(.Sentiment) | map({Sentiment: .[0].Sentiment, Count: length, Percentage: length| (. * (100 / ($TOTAL | tonumber)))}) | sort_by(.Count) | reverse
