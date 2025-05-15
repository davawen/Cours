#!/bin/sh

if !git rev-parse --is-inside-work-tree &> /dev/null; then
	echo "Not inside a git repository"
	exit 1
fi

TOP_LEVEL="$(git rev-parse --show-toplevel)"

cd "$TOP_LEVEL"

# Push current changes
git push

# Copy current git repo to subdirectory
mkdir -p rendered
mv rendered /tmp/Cours
cp -r "$TOP_LEVEL" /tmp
mv /tmp/Cours rendered

# Recompile PDFs locally
./render-local.sh

# Remove all git variables (just in case)
unset $(git rev-parse --local-env-vars)

# Go to the subdirectory's git repository
cd rendered

# Remove git ignore to allow pushing pdfs
rm .gitignore

# Overwrite rendered branch
git checkout -B rendered

if ! git diff-index --quiet HEAD --; then
    echo "Changes detected, committing and pushing PDFs"
    git add .
    git commit -m "Compiled all .typ and .typst files"
    git push origin rendered --force
fi
