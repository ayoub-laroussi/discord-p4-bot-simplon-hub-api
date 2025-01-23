FROM node:18-alpine

WORKDIR /app

# Installer globalement le CLI NestJS
RUN npm install -g @nestjs/cli

# Copier les fichiers du dossier api
COPY api/package*.json ./

RUN npm install

COPY api/ .

EXPOSE 3000

# Utiliser start:dev pour le développement avec hot reload
CMD ["/bin/sh", "-c", "npm run start:dev"]