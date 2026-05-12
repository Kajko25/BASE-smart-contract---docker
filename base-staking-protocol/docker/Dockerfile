FROM node:20-alpine

WORKDIR /app

# Instalacja zależności systemowych
RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm ci --only=production=false

COPY . .

# Kompilacja kontraktów przy budowaniu obrazu
RUN npm run compile

EXPOSE 8545

CMD ["sh"]
