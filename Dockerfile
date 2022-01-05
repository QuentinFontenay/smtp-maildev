FROM node:17-alpine

ENV NODE_ENV production

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD package.json /usr/src/app/

RUN npm install -g maildev && \
    npm prune && \
    npm cache clean \
    rm -rf /tmp/*

ADD . /usr/src/app/

EXPOSE 8080 4040:10000-30000