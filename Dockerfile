# Utiliser Debian  comme image de base
FROM debian:10

#Mettre à jour les paquets et installer les dépendances nécessaires

RUN apt-get update 
RUN apt-get install -y systemd 
RUN apt-get install -y  curl 
RUN apt install -y  procps
RUN apt-get install -y openjdk-11-jdk 
RUN apt-get install -y ansible
RUN apt-get install -y  nano 

# Supprime les listes de paquets téléchargées pour réduire la taille de l'image finale
RUN rm -rf /var/lib/apt/lists/*



# Expose Tomcat port
EXPOSE 8180


# Définir le répertoire de travail
WORKDIR /data

# Commande par défaut pour le conteneur
CMD ["/lib/systemd/systemd"]



