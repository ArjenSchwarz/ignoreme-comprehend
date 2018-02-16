# jq query for key phrases calculation
[[.[] | .KeyPhrases] | flatten | .[] | select(.Text != "[1]") | select(.Text != "[2]") | select(.Text != "[3]")] | group_by(.Text) | map({Text: .[0].Text, Count: length, Percentage: length| (. * (100 / ($TOTAL | tonumber)))}) | sort_by(.Count) | reverse | [limit(10;.[])]
