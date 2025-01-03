#!/bin/bash

repo_list=$(gh repo list Seeed-Studio --limit 1000 --json isPrivate,isArchived,nameWithOwner --jq '(.[] | select(.isArchived == false) | select(.isPrivate == false)).nameWithOwner')

for repo in $repo_list; do
    pr_list=$(gh pr list --repo $repo --json url,projectItems --jq '(.[] | select(isempty(.projectItems[]))).url')
    if [ "$pr_list" ]; then
        echo "$pr_list"
    fi
done
