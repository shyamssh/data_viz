DOCKER_IMAGE_NAME = data_viz/notebook
LATEST_IMAGE_TAG = 1.0.0
CONTAINER_NAME = notebook_app


build:
	docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME):$(LATEST_IMAGE_TAG) .

run:
	docker run --name $(CONTAINER_NAME) -d -v ${PWD}:/app -w /app -p 8899:8899 $(DOCKER_IMAGE_NAME):$(LATEST_IMAGE_TAG) jupyter notebook --ip=0.0.0.0 --port=8899 --NotebookApp.password_required=False --NotebookApp.token='' --NotebookApp.custom_display_url="http://localhost:8899" --allow-root


start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}
