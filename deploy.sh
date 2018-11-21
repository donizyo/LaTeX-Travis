#!/bin/bash

DEPLOY_BRANCH_NAME=deploy

git checkout --orphan "$DEPLOY_BRANCH_NAME"
git add *.pdf
git add *.log
git commit --author="traviscibot <>" -m "Publish"
git push -u origin +"$DEPLOY_BRANCH_NAME" # Force push onto deploy branch
