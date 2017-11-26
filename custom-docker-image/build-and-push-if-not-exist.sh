#!/bin/sh

set -eu
docker_dir=$(cd $(dirname $0); pwd)

repo_host=${IMAGE_REPO_HOST:-"quay.io"}
repo_name=${IMAGE_REPO_NAME:-"nobuoka/circleci-custom-image-example"}
expected_tag=$IMAGE_TAG
if [ -z $expected_tag ]; then echo "Tag must be specified" >&2; exit 1; fi

image_exist=$(
  IMAGE_REPO_HOST=$repo_host IMAGE_REPO_NAME=$repo_name IMAGE_TAG=$expected_tag \
    $docker_dir/scripts/image-exist-on-quay-repository.sh
)

if [ $image_exist = "true" ]; then
  echo "Image already exists" >&2
  exit 0
else
  image_name="$repo_host/$repo_name"
  IMAGE_NAME=$image_name EXPECTED_IMAGE_TAG=$expected_tag $docker_dir/build.sh

  image_tag="$image_name:$expected_tag"
  docker push $image_tag
fi
