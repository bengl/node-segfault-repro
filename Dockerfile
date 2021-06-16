FROM mcr.microsoft.com/playwright:bionic

USER root

RUN npm install -g yarn@1.22.10

WORKDIR /app

COPY package.json yarn.lock /app/

RUN yarn install --frozen-lockfile

RUN yarn add segfault-handler

COPY . /app

ENTRYPOINT ["/bin/sh", "-c", "yarn test"]
