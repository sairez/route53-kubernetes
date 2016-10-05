GO=CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go 
TAG=v1.0.1
BIN=route53-kubernetes
IMAGE=docker.io/sairez/$(BIN)

all: image
	docker push $(IMAGE):$(TAG)

build:
	$(GO) build -a -installsuffix cgo -o $(BIN) .

image: build
	docker build -t $(IMAGE):$(TAG) .

.PHONY: clean

clean:
	rm $(BIN)
