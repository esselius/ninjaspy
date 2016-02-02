DOCKER_REPO:=esselius/ninjaspy

.PHONY: build
build:
	docker build -t "$(DOCKER_REPO)" .

.PHONY: test
test: build
	docker run --rm -it "${DOCKER_REPO}" test
