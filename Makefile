SHELL := /bin/bash

# ----- Programs -----
COMPOSER = composer
PHP = php
SYMFONY = symfony
SYMFONY_CONSOLE = $(SYMFONY) console
PHP_UNIT = $(PHP) bin/phpunit
NPM = npm
DOCKER = docker

start: ## Starts the project
	$(DOCKER) compose up -d
	$(SYMFONY) server:start -d

stop:
	$(DOCKER) compose down
	$(SYMFONY) server:stop

test:
	$(SYMFONY_CONSOLE) doctrine:database:drop --force --env=test || true
	$(SYMFONY_CONSOLE) doctrine:database:create --env=test || true
	$(SYMFONY_CONSOLE) doctrine:migrations:migrate -n --env=test
	$(SYMFONY) php bin/phpunit

.PHONY: test
