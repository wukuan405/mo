.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

.PHONY: version
version: ## Output the current version
	@mo --help | tail -1

.PHONY: install
install: ## install
	@echo '$@ globally'
	@curl -sSL https://git.io/get-mo -o mo && chmod +x mo && sudo mv mo /usr/local/bin/
	@mo --help

.PHONY: upgrade
upgrade: install ## upgrade

.PHONY: test
test: ## test
	./diagnostic && ./run-tests
