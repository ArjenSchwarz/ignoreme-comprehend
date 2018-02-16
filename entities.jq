# JQ query for entities calculation
[.[] | .Entities | .[] | select(.Type != "QUANTITY") | select(.Type != "DATE")] | group_by(.Text) | map({Item: .[0].Text, Type: .[0].Type, Count: length, Percentage: length| (. * (100 / ($TOTAL | tonumber))) }) | sort_by(.Count) | reverse | [limit(10;.[])]
