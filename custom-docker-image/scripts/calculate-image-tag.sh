#!/bin/sh

set -eu
docker_dir=$(cd $(dirname $0)/..; pwd)

md5_sources_file=$(mktemp)
$(
  set -e
  cd $docker_dir
  md5sum $(find ./temp-context/* -name '*') >> $md5_sources_file
)

md5_file=$(mktemp)
md5sum $md5_sources_file >> $md5_file
image_sources_md5=$(cut -c 1-32 $md5_file)

rm $md5_sources_file
rm $md5_file

echo "md5-$image_sources_md5"
