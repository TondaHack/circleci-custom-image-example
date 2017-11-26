#!/bin/sh

set -eu
docker_dir=$(cd $(dirname $0)/..; pwd)

rm -rf $docker_dir/temp-context
mkdir $docker_dir/temp-context

cp $docker_dir/Dockerfile $docker_dir/temp-context
