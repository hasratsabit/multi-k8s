FROM node:alpine
WORKDIR "/app"
COPY ./package.json ./
COPY ./.npmrc ./
RUN npm install
COPY . .
CMD ["npm", "run", "start"]