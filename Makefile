.PHONY: build
build: ## builds the containers
	docker compose build --pull

.PHONY: up
up: ## starts the containers
	docker compose up -d

.PHONY: stop
stop: ## stops the containers
	docker compose stop

.PHONY: clean
clean: ## stops and obliterates the containers
	docker-compose down --volumes --remove-orphans --rmi local

.PHONY: setup
setup: ## app-specific setup
	cp -n .env.example .env || true

.PHONY: install
install: ## installs the application
	@echo 'Building the app...'
	@make setup
	@make build
	@make up
	@make vendor
	@make migrate
	@echo '✓ The app has been installed.'

.PHONY: reinstall
reinstall: ## reinstalls the application
	@echo 'Reinstalling the app...'
	@make clean
	@make install

.PHONY: migrate
migrate: ## migrates the database
	docker compose run --rm php php artisan migrate

.PHONY: migrate-force
migrate-force: ## migrates the database forcefully
	docker compose run --rm php php artisan migrate --force

.PHONY: tests
tests: ## runs the tests
	docker compose run --rm php-test php artisan test

.PHONY: shell
shell: ## opens a shell in the php container
	docker exec -it php /bin/bash

.PHONY: import
import: ## runs the importer
	docker compose run --rm php php artisan app:import-products --csvPath=/var/www/html/public/input.csv 

.PHONY: vendor
vendor: ## runs composer install in the php container
	docker compose run --rm php composer install && composer validate --ansi

.PHONY: help
help: ## Shows this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
