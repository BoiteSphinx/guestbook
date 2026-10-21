# ----- Programs -----
COMPOSER = composer
PHP = php
SYMFONY = symfony
SYMFONY_CONSOLE = $(PHP) bin/console
PHP_UNIT = $(PHP) bin/phpunit
NPM = npm
DOCKER = docker

start: ## Starts the project
	$(DOCKER) compose up -d
	$(SYMFONY) server:start -d

stop:
	$(DOCKER) compose down
	$(SYMFONY) server:stop
