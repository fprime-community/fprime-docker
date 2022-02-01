USERNAME=lmestar
CONTAINER_NAME=fprime
VERSION=3.0.0
IMAGE=$(USERNAME)/$(CONTAINER_NAME):$(VERSION)

all: up

build:
	docker build --build-arg FPRIME_VERSION=$(VERSION) -t $(IMAGE) -f Dockerfile.ubuntu .

log:
	docker logs $(CONTAINER_NAME) -f

up:
	docker run -it --rm \
	-v $(PWD):/app \
	--name $(CONTAINER_NAME) $(IMAGE) \


stop:
	docker stop $(CONTAINER_NAME)