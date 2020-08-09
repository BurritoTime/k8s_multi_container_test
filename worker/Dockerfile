FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install --loglevel=error
COPY ./ ./
CMD ["npm", "run", "start"]
