FROM node:12-alpine

# Setup user
ENV USER=natreg-user
RUN adduser --disabled-password --gecos "" $USER

# Create app dir
WORKDIR /app

# Install app dependencies
COPY ./package.json .
COPY ./package-lock.json .
RUN npm ci

# Bundle app source
COPY ./ ./

USER $USER
CMD [ "node", "server.js" ]
