noir=\033[0;30m 
gris=\e[1;30m 
rougefonce=\033[0;31m
rose=\033[1;31m
vertfonce=\033[0;32m 
orange=\033[0;33m 
jaune=\033[1;33m 
bleufonce=\033[0;34m 
bleuclair=\033[1;34m 
violetfonce=\033[0;35m 
violetclair=\033[1;35m
cyanfonce=\033[0;36m 
cyanclair=\033[1;36m 
grisclair=\033[0;37m'
blanc=\033[1;37m
neutre=\033[0;m



help:  ## Affiche cette aide
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


install: ## Build glossaire-app
	@echo -e "${rougefonce}********* Build glossaire-app *********${neutre}"
	docker-compose -f docker-compose.builder.yml run --rm install
	
install-api: ## Build glossaire-api
	@echo "${rougefonce}********* Build glossaire-api *********${neutre}"
	docker-compose -f docker-compose.builder-api.yml run --rm install
	
fix: ## Installer les fix (mise a jour des dépendances) de glossaire-app
	@echo "********* Mise à jour des dépendances NPM app *********${neutre}"
	docker-compose -f docker-compose.builder.yml run --rm fix
	
fix-api: ## Installe les fix (mise a jour des dépendances) de glossaire-api
	@echo "********* Mise à jour des dépendances NPM api *********${neutre}"
	docker-compose -f docker-compose.builder-api.yml run --rm fix
	
	
build: ## Build des containers
	@echo "${bleuclair}********* Build des conatiners *********${neutre}"
	docker-compose -f docker-compose.builder.yml run --rm build
	@echo "${orange}********* FIN DU BUILD *********${neutre}"

up: ## Démarre l'application
	@echo "${vertfonce}********* Démarrage de l'application *********${neutre}"
	docker-compose up -d --remove-orphans
	@echo "${rougefonce}********* Application démarré *********${neutre}"
	
down: ## Stoppe l'application
	@echo "${jaune}********* Arret de l'application *********${neutre}"
	docker-compose down
	@echo "${rougefonce}********* Application arrété *********${neutre}"


clean: ## Efface les images, le reseau
	docker-compose stop
	docker-compose rm
	docker network prune
	
.PHONY: install fix build up down clean
