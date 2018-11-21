#!/bin/bash

# CHANGE THE FOLLOWING VARIABLES
GITHUB_REPO_URL="https://github.com/donizyo/LaTeX-Travis/"

# !!! DO NOT CHANGE THE FOLLOWING VARIABLES !!!
GITHUB_FULL_URL="https://donizyo:$GITHUB_TOKEN@${GITHUB_REPO_URL:8}"
DEPLOY_BRANCH_NAME=deploy

# Routines
git checkout --orphan "$DEPLOY_BRANCH_NAME"
git rm --cached --ignore-unmatch -rf -- .
git add *.pdf
git add *.log
git commit --author="traviscibot <>" -m "Publish"
git push "$GITHUB_FULL_URL" +"$DEPLOY_BRANCH_NAME" # Force push onto deploy branch
