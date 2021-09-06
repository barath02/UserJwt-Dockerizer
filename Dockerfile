FROM node:14.17.6-alpine3.12 

# Create app directory,this is in our container/image
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install glob rimraf

RUN npm install

# Bundle app source
COPY . .

RUN npm run build

EXPOSE 8080

# Copy important files
COPY .eslintrc.js nest-cli.json tsconfig.json tsconfig.build.json ./

# Entrypoint command
CMD ["node", "dist/main"]