#!/bin/bash

# Met à jour les paquets
sudo apt update
sudo apt upgrade -y

# Installe les dépendances nécessaires
sudo apt install -y apt-transport-https ca-certificates curl software-properties-c
# Ajoute la clé GPG de Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Ajoute le dépôt Docker
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs)
# Met à jour la liste des paquets
sudo apt update

# Installe Docker
sudo apt install -y docker-ce

# Vérifie l'installation de Docker
sudo systemctl status docker

# (Optionnel) Ajoute l'utilisateur au groupe Docker
 sudo usermod -aG docker $USER


# Démarrer les environnements
echo "Démarrage de l'environnement de développement..."
docker-compose -f docker-compose.dev.yml up -d

echo "Démarrage de l'environnement de pré-production..."
docker-compose -f docker-compose.pre.yml up -d

echo "Démarrage de l'environnement de production..."
docker-compose -f docker-compose.prod.yml up -d

# Afficher l'état des conteneurs
echo "État des conteneurs :"
docker ps


