# Git Auto Comitter

Use the [bin folder](https://github.com/josep11/bin-folder) to install this launchd agent with the `launchctl-manager`

## Install and configure gh

```shell
brew install gh
gh config set git_protocol ssh
```

## To change the date of the commit do it like so

Install [git-redate](https://github.com/PotatoLabs/git-redate)
Then run: `git redate -c 10`
Edit accordingly and `git push -f`

## PR

```shell
gh pr create --title "The feature is done" --body "Everything works again"
```
