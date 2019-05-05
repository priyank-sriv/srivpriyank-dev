#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"


# Build the project.
hugo -t cupper-hugo-theme  # if using a theme, replace with `hugo -t <YOURTHEME>`


# Update submodule
git submodule update --remote --merge


# Go To Public folder
cd public


# Add changes to git.
git add .


# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"


# Come Back up to the Project Root
cd ..


# Push source and build repos.
git push origin master --recurse-submodules=check

