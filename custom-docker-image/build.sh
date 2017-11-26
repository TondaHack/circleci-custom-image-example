#!/bin/sh

set -eu
docker_dir=$(cd $(dirname $0); pwd)

image_name=${IMAGE_NAME:-"circleci-custom-image-example"}
expected_tag=${EXPECTED_IMAGE_TAG:-""}

$docker_dir/scripts/prepare-context-for-build.sh

actual_tag=$($docker_dir/scripts/calculate-image-tag.sh)
if [ -n "$expected_tag" -a "$expected_tag" != "$actual_tag" ]; then
  echo "Current generated image's tag not \`$expected_tag\`, but \`$actual_tag\`" >&2
  exit 11
fi

image_tag="$image_name:$actual_tag"
docker build -t $image_tag $docker_dir/temp-context
