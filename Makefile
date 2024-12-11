# Configurable variables
IMAGE_NAME = dtffprojectjn
CONTAINER_NAME = dtff-project-jn-container
HOST_PORT = 10000
CONTAINER_PORT = 8888
SRC_NOTEBOOK = src/main.ipynb
OUTPUT_NOTEBOOK = output/main_executed.ipynb

run:
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker stop
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker rm
	docker build -t $(IMAGE_NAME) -f Dockerfile .
	docker run -it --rm --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) -v $(PWD):/app $(IMAGE_NAME)

execute-notebook:
	@docker run --rm -v $(PWD):/app $(IMAGE_NAME) bash -c "jupyter nbconvert --to notebook --execute /app/$(SRC_NOTEBOOK) --output /app/$(OUTPUT_NOTEBOOK)"

stop:
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker stop
	@docker ps -a -q --filter "name=$(CONTAINER_NAME)" | xargs -r docker rm

clean:
	-docker rmi $(IMAGE_NAME)
