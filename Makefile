.DEFAULT_GOAL:=test

DOCKER_REPO:=esselius/ninjaspy

DOCKER_RUN:=docker run --rm -it

.PHONY: build
build:
	@docker build -t "$(DOCKER_REPO)" . > /dev/null

.PHONY: test
test: build
	@$(DOCKER_RUN) "${DOCKER_REPO}" test

.PHONY: run
run: build
	@$(DOCKER_RUN) "${DOCKER_REPO}" $(CMD)
