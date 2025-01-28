FROM node:22-alpine

WORKDIR /app

# Installer les dépendances système nécessaires pour pg
RUN apk add --no-cache python3 make g++ postgresql-dev

# Installer globalement le CLI NestJS
RUN npm install -g @nestjs/cli

# Copier les fichiers du dossier api
COPY api/package*.json ./

# Installer les dépendances npm
RUN npm install

# Copier le reste des fichiers
COPY api/ .

# Build l'application
RUN npm run build

EXPOSE 9011

# Utiliser start:dev pour le développement avec hot reload
CMD ["/bin/sh", "-c", "npm run start:dev"]