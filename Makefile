DOCKER_IMAGE_OWNER = 'free5gc'
DOCKER_IMAGE_NAME = 'base'
#DOCKER_IMAGE_TAG = 'latest'
DOCKER_IMAGE_TAG = 3.1.1
DOCKER_REGISTRY_URL = 18.221.164.72:6087/


.PHONY: base
base:
	docker build -t ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ./base
	docker image ls ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
	docker tag ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}

compose:
	export DOCKER_REGISTRY_URL=${DOCKER_REGISTRY_URL}
	export DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}
	cat docker-compose.yaml_template | envsubst > docker-compose.yaml_generated
	docker-compose -f docker-compose.yaml_generated	build
