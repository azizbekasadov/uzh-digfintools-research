# Configurable variables
IMAGE_NAME = dtffprojectjn
CONTAINER_NAME = dtff-project-jn-container
HOST_PORT = 10000
CONTAINER_PORT = 8888

run:
	docker build -t $(IMAGE_NAME) -f Dockerfile .
	docker run -it --rm --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) $(IMAGE_NAME)

stop:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

dev:
	docker build -t $(IMAGE_NAME) -f Dockerfile .
	docker run -it --rm --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) -v $(PWD):/app $(IMAGE_NAME)

clean:
	-docker rmi $(IMAGE_NAME)
