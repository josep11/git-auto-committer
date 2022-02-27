#!/bin/bash

rnd=$[ $RANDOM % 40 + 10 ]
echo "const a = $rnd;" >> dummy_file/example.js
git add .
git ci -m "updated data"
git push
gh pr create --title "The feature is done" --body "Everything works again"

gh pr merge 1 -m