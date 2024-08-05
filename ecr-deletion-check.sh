#!/bin/sh -l

echo "Hello"

time=$(date)

DELETED_FILES=$(git diff --name-status ${{ github.event.before }} ${{ github.sha }} | awk '$1 == "D" { print $2 }')
          echo "Deleted files:"
          cat "${DELETED_FILES}"
          ECR_DELETED=$(cat "${DELETED_FILES}" | grep -q 'github.com/ministryofjustice/cloud-platform-terraform-ecr-credentials' && echo true || echo false)
          echo "::set-output name=ecr_deleted::${ECR_DELETED}"


# add comment in the PR

