#!/bin/bash

DEPLOY_BRANCH_NAME=deploy # CONSTANT VALUE !!!

git checkout --orphan "$DEPLOY_BRANCH_NAME"
git add *.pdf
git add *.log
git commit --author="traviscibot <>" -m "Publish"
git push "https://donizyo:$GITHUB_TOKEN@github.com/donizyo/LaTeX-Travis.git" +"$DEPLOY_BRANCH_NAME" # Force push onto deploy branch
