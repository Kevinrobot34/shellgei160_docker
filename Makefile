IMG            := shellgei
CONTAINER_NAME := shellgei_container

build:
	@docker build -t ${IMG} .

run:
	@docker run -it -v $(shell pwd):/shellgei/git --rm \
		--name=${CONTAINER_NAME} ${IMG} /bin/bash