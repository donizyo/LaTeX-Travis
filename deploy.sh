#!/bin/bash
# vim: fileencoding=utf-8

# CHANGE THE FOLLOWING VARIABLES
GITHUB_REPO_URL="https://github.com/donizyo/LaTeX-Travis/"

# !!! DO NOT CHANGE THE FOLLOWING VARIABLES !!!
GITHUB_FULL_URL="https://donizyo:$GITHUB_TOKEN@${GITHUB_REPO_URL:8}"
DEPLOY_BRANCH_NAME=deploy

if [ -z $1 ]; then
  # argument list is needed by 'git add' in the following `else` block
  echo "No argument is supplied!"
  exit 1
else
  # Routines
  git checkout --orphan "$DEPLOY_BRANCH_NAME"
  git rm --cached --ignore-unmatch -rf -- .
  git add -- "$@"
  git commit --author="traviscibot <>" -m "Publish"
  # Force push onto deploy branch
  git push "$GITHUB_FULL_URL" +"$DEPLOY_BRANCH_NAME" 
fi
