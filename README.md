![Build Status](https://travis-ci.org/flemay/docker-3musketeers.svg?branch=master)
[![Project status](https://img.shields.io/badge/version-latest-green.svg)](https://github.com/flemay/docker-3musketeers/releases)
[![License](https://img.shields.io/dub/l/vibe-d.svg)](LICENSE)
[![Docker Build Status](https://img.shields.io/docker/build/flemay/3musketeers.svg)](https://hub.docker.com/r/flemay/3musketeers)

# Docker - 3musketeers

🐳 Lightweight image with essential tools for a 3 Musketeers project.

## Tools

### make

The [3 Musketeers](https://github.com/flemay/3musketeers) pattern suggests a `make target` to call a `make _target` using Compose. However, `make` would often be in big images like [Golang stretch](https://hub.docker.com/_/golang/) and not in small ones like [Alpine](https://hub.docker.com/_/alpine/). Not every project needs big images. There are solutions in the [3 Musketeers Guidelines](https://github.com/flemay/3musketeers/blob/master/GUIDELINES.md) to what to do when the desired image does not have `make`.

### zip

Another suggested pattern is to zip your dependencies. Even big images like [Golang stretch](https://hub.docker.com/_/golang/) does not include zip. It does include `tar` which you can use but sometimes a zip file is required like when deploying your Lambda function to AWS.

### Other handy tools

- curl
- git

## Usage

```bash
# build image
make build

# test image
make test

# go inside a 3Musketeers container
make shell
```

## Versioning

This image will always be built with the tag `latest` so tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

In a nutshell, any change to master triggers a [Travis build](https://travis-ci.org/flemay/docker-3musketeers) and if the tests passed it triggers a [Docker Hub build](https://hub.docker.com/r/flemay/3musketeers/builds/). The automatic build on Docker Hub has been disabled ensuring the build process to go only through Travis.

A cron task in Travis triggers a build every month making the image to be as fresh as possible automatically.
