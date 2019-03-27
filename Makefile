DOCKER_PASS?=
DOCKER_USER?=
TARGET?=0.1.0a4
BUILD_DATE:="$(shell date +"%Y-%m-%d %H:%M")"

# below vars are used internally
BUILD_OPTIONS?=--squash
CONTAINER_NAME?=bitcaster-docs
DOCKER_IMAGE_NAME=bitcaster/bitcaster-docs
DOCKER_IMAGE=bitcaster/bitcaster-docs:${TARGET}
RUN_OPTIONS?=

help:
	@echo "html             build docs"
	@echo "docker           build docker image with docs"
	@echo "clean            clean built artifacts"

clean:
	rm -fr html

.PHONY: html
html:
	sphinx-build -aE sources/ ./html

docker: html
	docker build \
			--build-arg VERSION=${TARGET} \
			--build-arg BUILD_DATE=${BUILD_DATE} \
			-t ${DOCKER_IMAGE} \
			-f Dockerfile .
	docker images | grep ${DOCKER_IMAGE_NAME}

release:
	pass docker/saxix | docker login -u saxix --password-stdin
	docker tag ${DOCKER_IMAGE_NAME}:${TARGET} ${DOCKER_IMAGE_NAME}:latest
	docker push ${DOCKER_IMAGE_NAME}:latest
	lazo rancher --insecure upgrade bitcaster:docs ${DOCKER_IMAGE_NAME}:latest

	$(MAKE) bump


bump:
	bumpversion --config-file=.bumpversion.cfg num --commit

.run:
	docker run \
	 		--rm \
	 		--name=${CONTAINER_NAME} \
			-p 8000:80 \
			${DOCKER_IMAGE} \
			${CMD}

run:
	$(MAKE) .run

