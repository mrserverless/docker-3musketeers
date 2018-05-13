![Build Status](https://travis-ci.org/flemay/docker-3musketeers.svg?branch=master)
[![Project status](https://img.shields.io/badge/version-latest-green.svg)](https://github.com/flemay/docker-golang/releases)
[![License](https://img.shields.io/dub/l/vibe-d.svg)](LICENSE)
[![Docker Build Status](https://img.shields.io/docker/build/flemay/3musketeers.svg)](https://hub.docker.com/r/flemay/3musketeers)

# Docker - 3musketeers

🐳 Lightweight image with essential tools for a 3 Musketeers project.

## Tools

### make

The [3 Musketeers](https://github.com/flemay/3musketeers) pattern suggests a `make target` to call a `make _target` using Compose. However, `make` would often be in big images like [Golang stretch](https://hub.docker.com/_/golang/) and not in small ones like [Alpine](https://hub.docker.com/_/alpine/). Not every project needs big images. There are solutions in the [3 Musketeers Guidelines](https://github.com/flemay/3musketeers/blob/master/GUIDELINES.md) to what to do when the desired image does not have `make`.

See [Echo](https://github.com/flemay/3mkts-cookiecutter-echo) example.

### zip

Another suggested pattern is to zip your dependencies. Even big images like [Golang stretch](https://hub.docker.com/_/golang/) does not include zip. It does include `tar` which you can use but sometimes a zip file is required like when deploying your Lambda function to AWS.

### Cookiecutter & git

The cherry on top! [Cookiecutter](https://github.com/audreyr/cookiecutter) is used for [3 Musketeers examples](https://github.com/flemay/3musketeers) and this image allows use to generete them with the only need of Docker! Cookiecutter needs `git` to download from a url.

## Usage

```bash
# build image
make build

# test image
make test

# go inside a 3Musketeers container
make shell

# tag adds a tag to the GitHub repository and automatically triggers Docker's build
make tag

# use 3musketeers image to generate from a Cookiecutter template
docker run -it --rm -v $PWD:/opt/app -w /opt/app flemay/3musketeers cookiecutter https://github.com/flemay/3mkts-cookiecutter-echo
```