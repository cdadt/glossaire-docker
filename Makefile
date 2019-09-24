help:  ## Affiche cette aide
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


install: ## Installe les dépendances npm pour glossaire-app
	docker-compose -f docker-compose.builder.yml run --rm install

install-api: ## Installe les dépendances npm pour glossaire-api
	docker-compose -f docker-compose.builder-api.yml run --rm install
	
fix: ## Installer les fix (mise a jour des dépendances) de glossaire-app
	docker-compose -f docker-compose.builder.yml run --rm fix

fix-api: ## Installe les fix (mise a jour des dépendances) de glossaire-api
	docker-compose -f docker-compose.builder-api.yml run --rm fix
	
build: ## Build des containers
	docker-compose -f docker-compose.builder.yml run --rm build

up: ## Démarre l'application
	docker-compose up -d --remove-orphans

down: ## Stoppe l'application
	docker-compose down

clean: ## Efface les images, le reseau
	docker-compose stop
	docker-compose rm
	docker network prune
	
.PHONY: install fix build up down clean
