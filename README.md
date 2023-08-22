# Docker-Wordpress

Stack de départ pour [Wordpress](https://wordpress.com/fr/), contenant [MariaDB](https://hub.docker.com/_/mariadb), [Wordpress](https://hub.docker.com/_/wordpress) (fpm), [NGINX](https://hub.docker.com/_/nginx).



## Installation locale

Installation des fichiers à partir de Github.

```
git clone https://github.com/SergeBregliano/docker-wordpress myWebSiteName
```

Renommer le fichier ``sample.env`` en ``.env``
Paramétrer le fichier ``.env`` avec les données souhaitées

Renommer le fichier `docker-compose.override-sample.env` en `docker-compose.override.env` de manière à passer Wordpress en mode débug localement.

Lancer une mise à jour et la création des containters

```
sh ./updateStack.sh
```
