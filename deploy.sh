#!/bin/bash
# vim: fileencoding=utf-8

# !!! DO NOT CHANGE THE FOLLOWING VARIABLES !!!
GIT_REMOTE_NAME=`git remote` # Example: origin
if [ -z "$GIT_REMOTE_NAME" ]; then
  echo "Git remote not found !!!"
  exit 1
fi
GITHUB_REPO_URL=`git remote get-url "$GIT_REMOTE_NAME"` # Example: "https://github.com/donizyo/LaTeX-Travis/"
GIT_REPO_PROTOCOL="${GITHUB_REPO_URL:0:5}"
if [ "$GIT_REPO_PROTOCOL" -ne "https" ]; then
  echo "Unsupported protocol detected: $GITHUB_REPO_URL !!!"
  exit 1
fi
GITHUB_USERNAME="${GITHUB_REPO_URL:19}"
if [ -n "$GITHUB_USERNAME" ]; then
  substr_index=`expr index $GITHUB_USERNAME '/'`
  ((substr_index--))
  GITHUB_USERNAME=${GITHUB_USERNAME:0:$substr_index}
fi
GITHUB_FULL_URL="https://$GITHUB_USERNAME:$GITHUB_TOKEN@${GITHUB_REPO_URL:8:-4}/"
DEPLOY_BRANCH_NAME=deploy
DEPLOY_AUTHOR_NAME="deploy-bot"
DEPLOY_AUTHOR_EMAIL="deploy@travis-ci.org"
DEPLOY_AUTHOR="$DEPLOY_AUTHOR_NAME <$DEPLOY_AUTHOR_EMAIL>"

echo "Github URL          : $GITHUB_REPO_URL"
echo "Github Username     : $GITHUB_USERNAME"
echo "Deploy Branch Name  : $DEPLOY_BRANCH_NAME"
echo "Deploy Author       : $DEPLOY_AUTHOR"

if [ -z $1 ]; then
  # argument list is needed by 'git add' in the following `else` block
  echo "No argument is supplied!"
  exit 1
else
  # Routines
  git checkout --orphan "$DEPLOY_BRANCH_NAME"
  git rm --cached --ignore-unmatch -rf -- .
  git add -- "$@"
  git commit --author="$DEPLOY_AUTHOR" -m "Publish"
  # Force push onto deploy branch
  git push "$GITHUB_FULL_URL" +"$DEPLOY_BRANCH_NAME"
fi
