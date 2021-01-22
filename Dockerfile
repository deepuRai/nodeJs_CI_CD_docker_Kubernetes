FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
 
RUN npm install
COPY . .
 
EXPOSE 4141
CMD [ "npm", "start" ]
