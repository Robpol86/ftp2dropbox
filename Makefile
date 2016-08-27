.PHONY: all fmt lint build install
ALL_PKGS = $(shell glide nv)


all: fmt test build


$(GOPATH)/bin/golint:
	go get -u github.com/golang/lint/golint


$(GOPATH)/bin/glide:
	go get -u github.com/Masterminds/glide


vendor: $(GOPATH)/bin/glide
	glide install


install: $(GOPATH)/bin/glide
	glide up


main: vendor
	go build -o main main.go


fmt:
	@echo Formatting Packages...
	go fmt $(ALL_PKGS)


lint: $(GOPATH)/bin/golint
	@echo "Running golint"
	golint ./...
	@echo "Running go vet"
	go vet $(ALL_PKGS)
	@echo "Checking gofmt"
	gofmt -l .


test:
	go test $(ALL_PKGS)
