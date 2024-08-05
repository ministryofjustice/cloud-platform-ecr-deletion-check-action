#!/bin/sh -l

echo "Hello"

echo $GITHUB_SHA
DELETED_FILES=$(git diff --name-status origin/main $GITHUB_SHA | awk '$1 == "D" { print $2 }')
echo "Deleted files: $DELETED_FILES" 
ECR_DELETED=$(cat "$DELETED_FILES" | grep -q 'github.com/ministryofjustice/cloud-platform-terraform-ecr-credentials' && echo true || echo false)
echo "::set-output name=ecr_deleted::${ECR_DELETED}"


# add comment in the PR

