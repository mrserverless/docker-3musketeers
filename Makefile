VERSION = latest
IMAGE_NAME ?= flemay/musketeers:$(VERSION)
ENVFILE = .env
DOCKER_RUN_ENVVARS = docker run --rm -v $(PWD):/opt/app -w /opt/app flemay/envvars
COMPOSE_RUN_ENVVARS = docker-compose run --rm envvars
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers

travis: build test triggerDockerHubBuilds clean
.PHONY: travis

all: envfileExample build test clean
.PHONY: all

.env:
	$(DOCKER_RUN_ENVVARS) envfile

envfileExample:
	$(DOCKER_RUN_ENVVARS) envfile --example --overwrite
.PHONY: envfileExample

pull:
	docker pull $(IMAGE_NAME)
.PHONY: pull

build:
	docker build --no-cache -t $(IMAGE_NAME) .
.PHONY: build

test: $(ENVFILE)
	$(COMPOSE_RUN_ENVVARS) validate
	docker run --rm $(IMAGE_NAME) make --version
	docker run --rm $(IMAGE_NAME) zip --version
	docker run --rm $(IMAGE_NAME) git --version
	docker run --rm $(IMAGE_NAME) curl --version
	docker run --rm $(IMAGE_NAME) which openssl
.PHONY: test

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) sh -l
.PHONY: shell

remove:
	docker rmi -f $(IMAGE_NAME)
.PHONY: remove

clean: $(ENVFILE)
	docker-compose down --remove-orphans
	$(DOCKER_RUN_ENVVARS) envfile --rm
.PHONY: clean

#######################
# DOCKER HUB TRIGGERS #
#######################

triggerDockerHubBuilds: $(ENVFILE)
	$(COMPOSE_RUN_ENVVARS) ensure
	$(COMPOSE_RUN_MUSKETEERS) make _triggerDockerHubBuildForTagLatest
.PHONY: triggerDockerHubBuilds

_triggerDockerHubBuildForTagLatest:
	curl -H "Content-Type: application/json" --data '{"docker_tag": "latest"}' -X POST $(DOCKERHUB_TRIGGER_URL)
.PHONY: _triggerDockerHubBuildForTagLatest