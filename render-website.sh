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
cp -r "$TOP_LEVEL" /tmp

# Remove all git variables (just in case)
unset $(git rev-parse --local-env-vars)

cd /tmp/Cours

# Remove git ignore to allow pushing pdfs
rm .gitignore
echo "rendered/" > .gitignore

python3 render-website.py remote

# Overwrite rendered branch
git checkout -B rendered

git add .
git commit -m "Compiled website"
git push origin rendered --force

cd $TOP_LEVEL

rm -rf /tmp/Cours
