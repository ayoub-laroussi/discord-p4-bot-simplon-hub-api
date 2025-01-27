# Discord P4 Bot - API

Ce projet est une API NestJS pour un bot Discord de jeu Puissance 4, déployée avec Docker.

## 🚀 Prérequis

- Node.js v22
- Docker et Docker Compose
- Un compte Docker Hub
- Un VPS avec Docker installé

## 🛠 Installation locale

1. Cloner le projet
```bash
git clone https://github.com/votre-username/discord-p4-bot.git
cd discord-p4-bot
```


2. Installer les dépendances
```bash
cd api
npm install
```

3. Configurer les variables d'environnement
```bash
# Créer un fichier .env dans le dossier api
DATABASE_URL=postgresql://postgres:postgres@postgres:5432/postgres
REDIS_URL=redis://redis:6379
```

4. Lancer avec Docker Compose
```bash
docker compose up -d
```

L'API sera disponible sur `http://localhost:3000`

## 🚀 Déploiement

Le déploiement est automatisé via GitHub Actions. À chaque push sur la branche `main`, le workflow :
1. Construit l'image Docker
2. La pousse sur Docker Hub
3. Déploie sur le VPS

### Configuration requise

Configurer les secrets suivants dans GitHub :
- `DOCKERHUB_USERNAME` : Nom d'utilisateur Docker Hub
- `DOCKERHUB_TOKEN` : Token d'accès Docker Hub
- `DATABASE_URL` : URL de connexion PostgreSQL
- `REDIS_URL` : URL de connexion Redis
- `VPS_HOST` : Adresse IP du VPS
- `VPS_USERNAME` : Nom d'utilisateur SSH
- `VPS_SSH_KEY` : Clé SSH privée

## 🏗 Architecture

- `api/` : Code source NestJS
- `nginx/` : Configuration du reverse proxy
- `Dockerfile` : Configuration de build
- `docker-compose.yml` : Configuration des services
  - API NestJS
  - Base de données PostgreSQL
  - Cache Redis
  - Reverse proxy Nginx

## 📝 Endpoints API

- Documentation Swagger disponible sur `/api/docs`

## 🧪 Tests

```bash
# Tests unitaires
npm run test

# Tests e2e
npm run test:e2e

# Couverture de code
npm run test:cov
```
