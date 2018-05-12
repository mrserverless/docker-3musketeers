# Docker 3 Musketeers

Lightweight image containing the essentials for a 3 Musketeers project.

## Tools

- make
- zip
- git
- [Cookiecutter](https://github.com/audreyr/cookiecutter)

## Usage

```bash
# build image
make build

# test image
make test

# go inside a 3Musketeers container
make shell

# tag which will trigger docker's build
make tag

# use 3musketeers image to generate from a Cookiecutter template
docker run -it --rm -v $PWD:/opt/app -w /opt/app flemay/3musketeers:1.0.0 cookiecutter https://github.com/flemay/3mkts-cookiecutter-echo
```