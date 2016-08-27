ALL_PKGS := $(shell glide nv)

all: fmt install test build

fmt:
	@echo Formatting Packages...
	go fmt $(ALL_PKGS)

lint:
	@echo "Running golint"
	golint ./...
	@echo "Running go vet"
	go vet $(ALL_PKGS)
	@echo "Checking gofmt"
	gofmt -l .

$(GOPATH)/bin/glide:
	go get -u github.com/Masterminds/glide

install: $(GOPATH)/bin/glide
	glide up

test:
	go test $(ALL_PKGS)

build:
	echo TODO
