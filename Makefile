VERSION = 1.0.0
IMAGE_NAME ?= flemay/3musketeers:$(VERSION)
TAG = $(VERSION)

pull:
	docker pull $(IMAGE_NAME)
.PHONY: pull

build:
	docker build --no-cache -t $(IMAGE_NAME) .
.PHONY: build

test:
	docker run --rm $(IMAGE_NAME) make --version
	docker run --rm $(IMAGE_NAME) zip --version
	docker run --rm $(IMAGE_NAME) git --version
	docker run --rm $(IMAGE_NAME) cookiecutter --version
.PHONY: test

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) sh -l
.PHONY: shell

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
.PHONY: tag