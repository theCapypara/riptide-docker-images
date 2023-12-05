# DON'T MODIFY THIS FILE, IT WILL BE OVERWRITTEN
# use Makefile instead to extend this file

PROJECT_PATH=$(shell pwd)
RIPTIDE_BIN=$(shell which riptide)
RIPTIDE_SERVICE=shopify
RIPTIDE_SOURCE=/src
APP_NAME=$(shell basename $(CURDIR))
DOCKER_IMAGE=riptidepy/shopify:latest
DOCKER_USER=docker

## Make all targets .PHONY
.PHONY:

## Self documentation
## @see https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
## ---------------------------------------------------------------------------------------------------------------------
help:: # Show list of targets with short description (default)
	@echo " "
	@echo "Passing arguments:"
	@echo " "
	@echo "make target key1=value1 key2=value2"
	@echo " "
	@echo List of targets:
	@echo " "
	@grep -E -ho '[a-zA-Z_-]+::?.*?## ?.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = "::?.*?##\\s?"}; {}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

## check if variable is set
## use this as pre recipe for targets with arguments
arg-guard-%::
	@#echo "${$*}"
	@if [ -z '${${*}}' ]; then $(MAKE); echo; echo 'Variable $* not set'; echo; exit 1; fi

init-directories:: ## initialize directories
	@[ -d ~/.config/shopify ] || mkdir ~/.config/shopify
	@[ -d ~/.config/shopify-cli-kit-nodejs ] || mkdir ~/.config/shopify-cli-kit-nodejs
	@[ -d ~/.config/shopify-cli-app-nodejs ] || mkdir ~/.config/shopify-cli-app-nodejs
	@[ -d ~/.config/shopify-cli-host-theme-conf-nodejs ] || mkdir ~/.config/shopify-cli-host-theme-conf-nodejs
	@[ -d ~/.cache/shopify-cli-nodejs ] || mkdir ~/.cache/shopify-cli-nodejs
	@[ -d ~/.cache/shopify ] || mkdir ~/.cache/shopify
	@[ -d ~/.cache/@shopify ] || mkdir ~/.cache/@shopify
	@[ -d ~/.cache/shopify-gems-nodejs ] || mkdir ~/.cache/shopify-gems-nodejs
	@[ -d ~/.config/composer ] || mkdir ~/.config/composer
	@[ -d ~/.cache/composer ] || mkdir ~/.cache/composer
	@[ -d ~/.config/ngrok ] || mkdir ~/.config/ngrok
	@[ -d ~/.cache/yarn ] || mkdir ~/.cache/yarn
	@[ -d ~/.npm ] || mkdir ~/.npm

define move-from-subdir-cmd
	@export RIPTIDE_DONT_SHOW_EXEC_WARNING=1 && \
	$(RIPTIDE_BIN) start -s $(RIPTIDE_SERVICE) -c keep_running && \
	$(RIPTIDE_BIN) exec --command "rm -rf $(RIPTIDE_SOURCE)/${APP_NAME}/.git" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) exec --command "bash -c 'for i in \$$(ls -d {"$(RIPTIDE_SOURCE)/${APP_NAME}/"*,"$(RIPTIDE_SOURCE)/${APP_NAME}/".*} | tail -n +3); do rm -rf $(RIPTIDE_SOURCE)/\$${i#$(RIPTIDE_SOURCE)/${APP_NAME}/}; mv \$$i $(RIPTIDE_SOURCE)/; done;'" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) exec --command "rm -rf \"$(RIPTIDE_SOURCE)/${APP_NAME}\"" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) stop -s $(RIPTIDE_SERVICE)
endef

create-php:  ## newly create app from php template
	@$(RIPTIDE_BIN) cmd yarn create @shopify/app --template php --name=${APP_NAME}
	$(move-from-subdir-cmd)

install-php: init-directories ## install dev environment for php
	@$(RIPTIDE_BIN) cmd yarn install
	@export RIPTIDE_DONT_SHOW_EXEC_WARNING=1 && \
	$(RIPTIDE_BIN) start -s $(RIPTIDE_SERVICE) -c keep_running && \
	$(RIPTIDE_BIN) exec --command "cp $(RIPTIDE_SOURCE)/web/.env.example $(RIPTIDE_SOURCE)/web/.env" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) exec --command "sed -i \"s/APP_NAME=.*/APP_NAME=${APP_NAME}/\" $(RIPTIDE_SOURCE)/web/.env" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) exec --command "sed -i 's/DB_DATABASE=.*/DB_DATABASE=\\$(RIPTIDE_SOURCE)\/web\/storage\/db.sqlite/' $(RIPTIDE_SOURCE)/web/.env" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) exec --command "touch $(RIPTIDE_SOURCE)/web/storage/db.sqlite" $(RIPTIDE_SERVICE) && \
	$(RIPTIDE_BIN) stop -s $(RIPTIDE_SERVICE)
	@$(RIPTIDE_BIN) cmd composer install
	@$(RIPTIDE_BIN) cmd artisan key:generate
	@$(RIPTIDE_BIN) cmd artisan migrate

create-nodejs: ## newly create app from nodejs template
	@$(RIPTIDE_BIN) cmd yarn create @shopify/app --template node --name=${APP_NAME}
	$(move-from-subdir-cmd)

install-nodejs: ## install dev environment for nodejs
	@echo Install root dependencies...
	@$(RIPTIDE_BIN) cmd yarn install
	@echo Install backend dependencies...
	@cd web && $(RIPTIDE_BIN) cmd yarn install
	@echo Install frontend dependencies...
	@cd web/frontend && $(RIPTIDE_BIN) cmd yarn install

define dev-container-run-cmd
	@docker run --rm -it \
		-u $(DOCKER_USER) \
		--network=host \
		-v ~/.config/composer:/home/$(DOCKER_USER)/.config/composer \
		-v ~/.cache/composer:/home/$(DOCKER_USER)/.cache/composer \
		-v ~/.config/shopify:/home/$(DOCKER_USER)/.config/shopify \
		-v ~/.config/shopify-cli-kit-nodejs:/home/$(DOCKER_USER)/.config/shopify-cli-kit-nodejs \
		-v ~/.config/shopify-cli-app-nodejs:/home/$(DOCKER_USER)/.config/shopify-cli-app-nodejs \
		-v ~/.config/shopify-cli-host-theme-conf-nodejs:/home/$(DOCKER_USER)/.config/shopify-cli-host-theme-conf-nodejs \
		-v ~/.cache/shopify-cli-nodejs:/home/$(DOCKER_USER)/.cache/shopify-cli-nodejs \
		-v ~/.cache/@shopify:/home/$(DOCKER_USER)/.cache/@shopify \
		-v ~/.cache/shopify:/home/$(DOCKER_USER)/.cache/shopify \
		-v ~/.cache/shopify-gems-nodejs:/home/$(DOCKER_USER)/.cache/shopify-gems-nodejs \
		-v ~/.config/ngrok:/home/$(DOCKER_USER)/.config/ngrok \
		-v ~/.cache/yarn:/home/$(DOCKER_USER)/.cache/yarn \
		-v ~/.npm:/home/$(DOCKER_USER)/.npm \
		-v $(shell pwd):$(RIPTIDE_SOURCE) \
		-w $(RIPTIDE_SOURCE) \
		--env-file $(shell pwd)/.env \
		$(DOCKER_IMAGE)
endef

app-dev: init-directories ## start dev app
	$(dev-container-run-cmd) \
		bash -c "./node_modules/.bin/shopify app dev" ||:

init-app: init-directories ## initialize app
	$(dev-container-run-cmd) \
		bash -c "./node_modules/.bin/shopify app dev --reset" ||:

init-deploy: init-directories ## initialize deploy
	$(dev-container-run-cmd) \
		bash -c "./node_modules/.bin/shopify app deploy --reset" ||:

run-in-container: init-directories ## run command in Shopify container, pass argument command
	$(dev-container-run-cmd) $(command)

## default target
## ---------------------------------------------------------------------------------------------------------------------
.DEFAULT_GOAL:= help
