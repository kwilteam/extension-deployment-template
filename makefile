.DEFAULT_GOAL := help

.PHONY: help docker

help:
	@# 20s is the width of the first column
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

download-images: ## downloads the kwil image
	@docker pull kwildb/kwil:latest

run: ## runs the kwil container with the math extension
	@docker compose up -d kwil extension-1

run-nginx: ## runs the kwil container with the math extension and nginx
	@docker compose up -d kwil extension-1 nginx

delete: ## deletes the kwil and math containers
	@docker compose down

stop: ## stops the kwil and math containers
	@docker compose stop

generate-ssl:
	@chmod +x ./scripts/cert.sh
	@./scripts/cert.sh renew_certs


download-and-run: download-images run ## downloads the kwil image and runs the containers

download-and-run-ssl: download-images generate-ssl run-nginx ## downloads the kwil image and runs the containers with ssl