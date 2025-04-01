FROM node:14
WORKDIR /the/workdir/path
COPY package.json . 
RUN npm install
COPY .  .
EXPOSE 8080
CMD [ "node", "app.js" ]