Custom Docker Image example on CircleCI
==========

This repository shows the way to use custom Docker image on CircleCI 2.0 Workflow.

* The definition of jobs and workflows : [.circleci/config.yml](./.circleci/config.yml)
    * `build-custom-docker-image` job : building a custom Docker image and then pushing the image to Docker registry on Quay
    * `run-on-custom-docker-image` job : run in a container from the custom image, that is pushed in the leading job
* Dockerfile of custom Docker image : [custom-docker-image/Dockerfile](./custom-docker-image/Dockerfile)

## Related resources

* [Workflows on CircleCI](https://circleci.com/gh/nobuoka/workflows/circleci-custom-image-example)
* [Docker repository on Quay](https://quay.io/repository/nobuoka/circleci-custom-image-example)
