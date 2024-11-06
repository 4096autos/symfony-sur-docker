#!/bin/bash

# Fonction d'installation de Docker
install_docker() {
    echo "Merci à 4096autos@gmail.com - Met à jour les paquets et installe les dependances"

    # Mettre à jour les paquets existants
    sudo apt update -y && sudo apt upgrade && sudo apt update
    
    # Installer les dépendances nécessaires
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Ajouter la clé GPG officielle de Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Ajouter le dépôt Docker
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Mettre à jour les paquets
    sudo apt update -y

    # Installer Docker
    sudo apt install -y docker-ce

    # Démarrer Docker
    sudo systemctl start docker
    sudo systemctl enable docker

    sudo usermod -aG docker $USER
    newgrp docker
    docker ps
    
    # Vérifier l'installation de Docker
    docker --version
}

# Fonction d'installation de Docker Compose
install_docker_compose() {
    echo "Installation de Docker Compose..."

    # Télécharger la dernière version stable de Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Donner des permissions d'exécution
    sudo chmod +x /usr/local/bin/docker-compose

    # Vérifier l'installation de Docker Compose
    docker-compose --version
}

# Vérifier si Docker est déjà installé
if ! command -v docker &> /dev/null
then
    echo "Docker n'est pas installé. Installation de Docker..."
    install_docker
else
    echo "Docker est déjà installé."
fi

# Vérifier si Docker Compose est déjà installé
if ! command -v docker-compose &> /dev/null
then
    install_docker_compose
else
    echo "Docker Compose est déjà installé."
fi

echo " Installation de Docker terminée."
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo " ================================================="
echo " Configuration des envitonnement dev - pre - prod  "
echo " ================================================="
echo "       "
echo " =============================================================="
echo " Merci à 4096autos@gmail.com"
echo " Pour me soutenir  Faites un don ORANGE-Money (+223 7001 0909)"
echo " =============================================================="

# Démarre les environnements
echo " Démarrage de l'environnement de développement dev..."
docker-compose -f docker-compose.dev.yml up -d

echo " Démarrage de l'environnement de pré-production pre..."
docker-compose -f docker-compose.pre.yml up -d

echo " Démarrage de l'environnement de production prod..."
docker-compose -f docker-compose.prod.yml up -d

# Afficher l'état des conteneurs
echo " État des conteneurs : "
docker ps

#Install composer
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo " ==================="
echo " Install composer et Met à jour les paquets"
echo " ==================="
# Met à jour les paquets
sudo apt update
sudo apt upgrade -y

# Installe PHP et extensions nécessaires
sudo apt install -y php-cli php-zip php-json php-phar curl



# Vérifier si PHP 8.3 est installé
php_version=$(php -v | grep -oP '^PHP 8\.3')

if [[ -z "$php_version" ]]; then
    echo "PHP 8.3 n'est pas installé. Veuillez installer PHP 8.2 d'abord."
    exit 1
fi

echo "PHP 8.3 est installé. Vérification de l'extension ext-xml..."

# Installer l'extension PHP XML pour PHP 8.3
echo "Installation de l'extension php8.3-xml..."
sudo apt-get update
sudo apt-get install -y php8.3-xml

# Vérifier si l'extension a bien été installée
if php -m | grep -q 'xml'; then
    echo "L'extension ext-xml est maintenant installée et activée."
else
    echo "L'extension ext-xml n'a pas pu être installée ou activée. Veuillez vérifier les erreurs."
    exit 1
fi

# Vérifier les fichiers de configuration PHP
echo "Vérification des fichiers de configuration PHP..."
php_ini_files=$(php --ini)

echo "Fichiers de configuration PHP utilisés par PHP CLI :"
echo "$php_ini_files"

# Vérification finale de l'extension XML
echo "Vérification de l'activation de l'extension XML..."
php -m | grep 'xml'

echo "Installation et configuration terminées."










# Télécharge l'installateur de Composer
curl -sS https://getcomposer.org/installer | php

# Déplace Composer dans un répertoire global
sudo mv composer.phar /usr/local/bin/composer

# Vérifie l'installation
composer --version

# Informe l'utilisateur
echo " Composer a été installé avec succès."

# install symfony 5.4
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo "       "
echo " ======================"
echo " Install symfony 5.4 "
echo " ======================"
echo "      "
echo " =============================================================="
echo " "
echo "  https://linktr.ee/bubacarsd - Faire un don ORANGE-Money "
echo "            Pour me soutenir (+223 7001 0909) "
echo " "
echo " =============================================================="

 sudo rm -R app && composer create-project symfony/website-skeleton:^5.4 app
echo "      "
echo "      "

sudo apt update && sudo apt upgrade && sudo apt update
echo "      "
echo "      "
echo "      "
echo " Si vous êtes arrivé(e) ici c'est que vous connaissez : "
echo " GIT - PHP - POO - Mariadb - Debian - Apache => Docker"
echo "      "
echo "      "
echo "      "

echo "      "
echo "      "
echo "      "
echo " ### ----------------------------------"
echo "   ENV dev"
echo "     SGBD : mariadb:10.5.18 port: 3310"
echo "     phpmyadmin_dev         port: 8020"
echo "     www_dev                port: 9000"
echo " ### ----------------------------------"
echo "   ENV pre"
echo "     SGBD : mariadb:10.5.18 port: 3311"
echo "     phpmyadmin_dev         port: 8021"
echo "     www_dev                port: 9001"
echo "     user"		   
echo "     password"		   
echo " ### ----------------------------------"
echo "   ENV prod"
echo "     SGBD : mariadb:10.5.18 port: 3312"
echo "     phpmyadmin_prod        port: 8022"
echo "     www_prod               port: 80"
echo "  "
echo "     ROOT_PASSWORD: mercifaa             # Mot de passe pour l'utilisateur root"
echo "     DATABASE: db_prod                   # Base de données à créer"
echo "     USER: faa                           # Nouvel utilisateur"
echo "     PASSWORD: mercifaa                  # Mot de passe de l'utilisateur"
echo " ### ----------------------------------"
echo "      "
echo "      "
echo "      "
echo " =============================================================="
echo " =============================================================="
echo " "
echo "  https://linktr.ee/bubacarsd - Faire un don ORANGE-Money "
echo "            Pour me soutenir (+223 7001 0909) "
echo " "
echo " =============================================================="
echo " =============================================================="
echo " "
echo " "
docker images
echo " "
docker ps -a
echo " "
echo " Instance encours ..."
docker ps
echo " "
echo " "
echo " =============================================================="
echo " =============================================================="
echo " "
echo "  https://linktr.ee/bubacarsd - Faire un don ORANGE-Money "
echo "            Pour me soutenir (+223 7001 0909) "
echo " "
echo " =============================================================="
echo " =============================================================="
