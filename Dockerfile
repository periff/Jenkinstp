# Utilisez une image de base avec Maven préinstallé
FROM maven:3.8-openjdk-11

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier pom.xml dans le répertoire de travail
COPY pom.xml .

# Téléchargez les dépendances Maven
RUN mvn clean install -DskipTests

# Copiez le reste des fichiers dans le répertoire de travail
COPY . .

# Exécutez la construction de l'application
RUN mvn package -DskipTests

# Définissez la commande à exécuter lorsque le conteneur démarre
CMD ["java", "-jar", "target/votre-application.jar"]
