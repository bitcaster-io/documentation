DOCKER_PASS?=
DOCKER_USER?=
TARGET?=0.1
BUILD_DATE:="$(shell date +"%Y-%m-%d %H:%M")"
# below vars are used internally
BUILD_OPTIONS?=--squash
CONTAINER_NAME?=bitcaster-docs
DOCKER_IMAGE_NAME=bitcaster/bitcaster-docs
DOCKER_IMAGE=${DOCKER_IMAGE_NAME}:${TARGET}
DOCKERFILE?=Dockerfile
RUN_OPTIONS?=
PIPENV_ARGS?=
VOLUME=~build/volumes/var/bitcaster/
VERSION?=$(shell cat ../VERSION)

help:
	@echo "build               build docs"
	@echo "docker              build docker image with docs"

build:
	sphinx-build -aE sources/ ${BUILDDIR}/docs

docker:
	cd .. && docker build \
			--build-arg VERSION=${TARGET} \
			--build-arg BUILD_DATE=${BUILD_DATE} \
			-t ${DOCKER_IMAGE} \
			-f docker/${DOCKERFILE} .
#	docker tag ${DOCKER_IMAGE_NAME}:${TARGET} ${DOCKER_IMAGE_NAME}:dev
	docker images | grep ${DOCKER_IMAGE_NAME}

release:
	pass docker/saxix | docker login -u saxix --password-stdin
	docker tag ${DOCKER_IMAGE_NAME}:${TARGET} ${DOCKER_IMAGE_NAME}:latest
	docker push ${DOCKER_IMAGE_NAME}:latest
	docker push ${DOCKER_IMAGE_NAME}:${TARGET}
	curl -XPOST https://hooks.microbadger.com/images/bitcaster/bitcaster/MQKzhkSXITqlkZMgcN1sQbKCnQo=
	lazo rancher --insecure upgrade bitcaster:bitcaster bitcaster/bitcaster:${TARGET}
	$(MAKE) bump

deploy:
	lazo

bump:
	cd .. && bumpversion --config-file=.bumpversion.cfg num --commit

