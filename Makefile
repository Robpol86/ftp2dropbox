ALL_PKGS = $(shell glide nv)


.PHONY: all
all: fmt install test build


.PHONY: fmt
fmt:
	@echo Formatting Packages...
	go fmt $(ALL_PKGS)


.PHONY: lint
lint:
	@echo "Running golint"
	golint ./...
	@echo "Running go vet"
	go vet $(ALL_PKGS)
	@echo "Checking gofmt"
	gofmt -l .


$(GOPATH)/bin/glide:
	go get -u github.com/Masterminds/glide


.PHONY: install
install: $(GOPATH)/bin/glide
	glide up


.PHONY: test
test:
	go test $(ALL_PKGS)


.PHONY: build
build:
	echo TODO
