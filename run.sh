#!/bin/bash

rnd=$[ $RANDOM % 40 + 10 ]
echo "const a = $rnd;" >> dummy_file/example.js
git add .
git ci -m "updated data"
git push
gh pr create --title "The feature is done" --body "Everything works fine"

# getting the PR number
pr_number=$(gh pr list --json number --jq ".[0].number" | cat)

if [[ -z "$pr_number" ]]; then
    echo error: there was to PR open
    exit
fi

echo "merging PR #$pr_number"
gh pr merge $pr_number -m