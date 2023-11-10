#!/bin/bash

# Fetch the latest changes from the remote repository
git fetch --prune

# Get the list of local branches that no longer exist on the remote
deleted_branches=$(git branch -vv | grep ': gone]' | awk '{print $1}')

# Loop through the list of deleted branches and delete them locally
for branch in $deleted_branches; do
    git branch -D $branch
    echo "Deleted local branch: $branch"
done
