# Docker-Wordpress

Stack de départ pour [Wordpress](https://wordpress.com/fr/), contenant [MariaDB](https://hub.docker.com/_/mariadb), [Wordpress](https://hub.docker.com/_/wordpress) (fpm), [redis](https://hub.docker.com/_/redis) et [NGINX](https://hub.docker.com/_/nginx).



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



## Taille des uploads

Dans ``docker > wordpress > uploads.ini`` modifier les valeurs ``upload_max_filesize`` et ``post_max_size``.

Dans ``docker > nginx > wordpress.conf`` modifier la valeur ``client_max_body_size``.



## Prise en charge de redis

La stack serveur installe [redis](https://redis.io/) par défaut mais nécessite une modification du fichier de configuration de Wordpress pour être fonctionnelle.

Wordpress va chercher à joindre le serveur redis sur l'adresse locale 127.0.0.1. Or le container ne répondra pas à cette adresse. Il faut donc spécifier le nom d'hôte du serveur redis.



Dans le fichier ``wp-config.php``, ajouter la ligne suivante : 

```php
define('WP_REDIS_HOST', 'redis');
```

Au dessus de :

```php
require_once ABSPATH . 'wp-settings.php
```

L'extension Wordpress [**Redis Object Cache**](https://fr.wordpress.org/plugins/redis-cache/) permet ensuite de gérer facilement le cache des objets.
