#!/bin/sh

set -eu

repo_host="$IMAGE_REPO_HOST"
if [ -z $repo_host ]; then echo "Repository host must be specified" >&2; exit 1; fi
repo_name="$IMAGE_REPO_NAME"
if [ -z $repo_name ]; then echo "Repository name must be specified" >&2; exit 1; fi
tag="$IMAGE_TAG"
if [ -z $tag ]; then echo "Tag must be specified" >&2; exit 1; fi

if [ $repo_host != "quay.io" ]; then
  echo "Repository host \`$repo_host\` not supportted" >&2
  exit 1
fi

status_code="$(curl -LI -o /dev/null -w '%{http_code}' -s https://quay.io/api/v1/repository/$repo_name/tag/$tag/images)"
if [ $status_code = "200" ]; then
  echo "true"
elif [ $status_code = "404" ]; then
  echo "false"
else
  echo "Unexpected status code \`$status_code\` is returned from Web API" >&2
  exit 2
fi
