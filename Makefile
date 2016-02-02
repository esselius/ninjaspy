.DEFAULT_GOAL:=test

NAME:=ninjaspy
DOCKER_REPO:=esselius/$(NAME)

SOURCE_CODE_FILES:=$(shell find src | grep .sh | grep -v assert.sh)

DOCKER_RUN:=docker run --rm -it

.PHONY: build
build:
	@docker build -t "$(DOCKER_REPO)" . > /dev/null

lint:
	@docker rm $(NAME)-lint > /dev/null
	@docker create --name $(NAME)-lint jrotter/shellcheck shellcheck $(SOURCE_CODE_FILES) > /dev/null
	@docker cp . $(NAME)-lint:.
	@docker start -ai $(NAME)-lint

.PHONY: test
test: build
	@$(DOCKER_RUN) "${DOCKER_REPO}" test

.PHONY: run
run: build
	@$(DOCKER_RUN) "${DOCKER_REPO}" $(CMD)
