#!/bin/bash

# Vérifiez si l'environnement est passé en argument
if [ -z "$1" ]; then
    echo "Usage: ./deploy.sh [dev|pre|prod]"
    exit 1
fi

ENV=$1

case $ENV in
    dev)
        COMPOSE_FILE="docker-compose.dev.yml"
        ;;
    pre)
        COMPOSE_FILE="docker-compose.pre.yml"
        ;;
    prod)
        COMPOSE_FILE="docker-compose.prod.yml"
        ;;
    *)
        echo "Environnement non valide. Choisissez entre dev, pre ou prod."
        exit 1
        ;;
esac

# Construire et démarrer le conteneur
echo "Déploiement de l'environnement $ENV..."
docker-compose -f $COMPOSE_FILE up -d --remove-orphans

# Afficher l'état des conteneurs
docker ps

