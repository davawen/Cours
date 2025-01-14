#!/usr/bin/env bash
set -e -u -o pipefail

MAIN_BRANCH="main"
TARGET_BRANCH="rendered"

error_exit() {
    echo "Error: $1"
    exit 1
}

compileall() {
    find . -type f \( -name "*.typ" -o -name "*.typst" \) ! -path "./typst/*" -print -exec typst compile {} \;
}

if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    error_exit "Not inside a git repository"
fi


if ! git rev-parse --verify "$TARGET_BRANCH" &> /dev/null; then
    git checkout -b "$TARGET_BRANCH"
else
    git checkout "$TARGET_BRANCH"
fi

git merge --no-ff --no-edit origin/"$MAIN_BRANCH" || error_exit "Failed to merge $MAIN_BRANCH"

compileall

if ! git diff-index --quiet HEAD --; then
    echo "Changes detected, committing and pushing"
    git add .
    git commit -m "Compiled all .typ and .typst files"
    git push origin "$TARGET_BRANCH" --force
fi


git checkout "$MAIN_BRANCH"