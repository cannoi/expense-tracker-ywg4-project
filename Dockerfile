FROM node:20-slim
WORKDIR /app
RUN apt-get update && apt-get install -y sqlite3 build-essential python3 && rm -rf /var/lib/apt/lists/*
COPY package*.json ./
RUN npm ci --prefer-offline --no-audit
COPY . .
EXPOSE 8080
CMD ["node", "server.js"]