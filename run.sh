#!/bin/bash

print_date(){   
    echo ----------------------------
    date
    echo ----------------------------
}

die() { echo "$*" 1>&2 ; exit 1; }

if [ $[RANDOM % 2] -eq 0 ]; then 
    echo 'random abort today'; 
    exit 0; 
fi

[ -f .shell_profile ] && . .shell_profile

print_date
>&2 $_  # $_, like !$, refers to the last argument of the previous command.

which gh >/dev/null
if [ $? -ne 0 ]; then
    die "gh is not in the path. Fix it by installing gh and loading homebrew path into the Launchd job\nRun 'eval "$(/opt/homebrew/bin/brew shellenv)"'"
fi

create_commit(){
    rnd=$[ $RANDOM % 40 + 10 ]
    echo "const a = $rnd;" >> dummy_file/example.js
    git add .
    git ci -m "updated data"
    git push
}

create_pr(){
    gh pr create --title "The feature is done" --body "Everything works fine"

    # getting the PR number
    pr_number=$(gh pr list --json number --jq ".[0].number" | cat)

    if [[ -z "$pr_number" ]]; then
        die "error: there was to PR open"
    fi

    echo "merging PR #$pr_number"
    gh pr merge $pr_number -m
}

git checkout dev
create_commit
create_pr
