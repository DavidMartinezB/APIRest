FROM node:17

WORKDIR /usr/src/app

COPY prueba/package*.json ./
COPY prueba/dist/ ./dist/

RUN npm install --only=production

EXPOSE 3000

CMD ["node", "dist/main.js"]
