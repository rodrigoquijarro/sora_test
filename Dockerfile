FROM node:14

#1. Creating app directory
WORKDIR /usr/src/app

#2. Installing app dependencies
#3. Wildcard used to ensure both package.json AND package-lock.json are copied
COPY testapp/package*.json ./

#4. Running npm
RUN npm install

#5. Bundle testapp source
COPY testapp/. .
EXPOSE 443
CMD [ "node", "appserver.js" ]