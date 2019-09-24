# glossaire-docker

## Création des containers 

Créer un dossier pour l'application, ce positionner dedans, puis cloner:

git clone https://github.com/cdadt/glossaire-docker.git

aller dans le dossier glossaire-docker

puis cloner glossaire-app et glossaire-api

git clone https://github.com/cdadt/glossaire-app.git
git clone https://github.com/cdadt/glossaire-api.git

## glossaire app
### Modification de package.json

Pour pouvoir accéder a l'application conteneuriser, modifier la ligne 

```
"start": "ng serve 
```

du fichier `package.json` comme suit:

```
  "name": "glossaire-cdadt",
  "version": "0.0.0",
  "scripts": {
    "ng": "ng",
    "start": "ng serve --host 0.0.0.0 --poll=500",
    "build": "ng build --prod=true",
    "test": "ng test",
    "lint": "ng lint",
    "e2e": "ng e2e"
```
    
**Cela va forcer l'application à écouter pour toutes les adresses ip**.

## Construction des containers

Exécuter les commandes suivantes dans le repertoire `glossaire-docker`

* _Build des containers_

```
make build 
```
* _Installer les dépendances npm pour glossaire-app_

```
make install
```
* _Installer les dépendances npm pour glossaire-api_

```
make install-api
```
* _Installer les fix de glossaire-app_

```
make fix
```
* _Installer les fix de glossaire-api_

```
make fix-api
```


-------

## Démarrer l'application:
```
make up
```

-------

## Stopper l'application:
```
make down
```

-------

## Effacer les images:
```
make clean
```

