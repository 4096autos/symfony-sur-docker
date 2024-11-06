#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 {feature|dev|pre|main} {branch-name|tag-name}"
    exit 1
fi

# Récupération des arguments
ENVIRONMENT=$1
BRANCH_OR_TAG=$2

# Fonction pour afficher le message d'aide
function show_help {
    echo "Usage: $0 {feature|dev|pre|main} {branch-name|tag-name}"
    echo "  feature   : Créer et déployer une nouvelle fonctionnalité."
    echo "  dev       : Déployer l'environnement de développement."
    echo "  pre       : Déployer l'environnement de préproduction."
    echo "  main      : Déployer l'environnement de production."
    echo "  tag       : Marquer une version avec un tag."
}

# Gestion des environnements
case $ENVIRONMENT in
    feature)
        echo "Création d'une nouvelle branche pour la fonctionnalité : $BRANCH_OR_TAG"
        git checkout dev
        git checkout -b "feature/$BRANCH_OR_TAG"
        echo "Branche 'feature/$BRANCH_OR_TAG' créée. Développez votre fonctionnalité."
        ;;
    dev)
        echo "Déploiement sur l'environnement de développement..."
        git checkout dev
        git pull origin dev
        # Ajoutez ici vos commandes pour déployer sur dev
        echo "Environnement de développement mis à jour."
        ;;
    pre)
        echo "Déploiement sur l'environnement de préproduction..."
        git checkout pre
        git pull origin pre
        # Ajoutez ici vos commandes pour déployer sur pre
        echo "Environnement de préproduction mis à jour."
        ;;
    main)
        echo "Déploiement sur l'environnement de production..."
        git checkout main
        git pull origin main
        # Ajoutez ici vos commandes pour déployer sur production
        echo "Environnement de production mis à jour."
        ;;
    tag)
        echo "Création d'un tag : $BRANCH_OR_TAG"
        git tag -a "$BRANCH_OR_TAG" -m "Version $BRANCH_OR_TAG - Déploiement en production"
        git push origin "$BRANCH_OR_TAG"
        echo "Tag '$BRANCH_OR_TAG' créé et poussé."
        ;;
    *)
        echo "Environnement inconnu : $ENVIRONMENT"
        show_help
        exit 1
        ;;
esac

echo "Déploiement terminé pour l'environnement : $ENVIRONMENT"

