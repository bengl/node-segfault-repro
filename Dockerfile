FROM ubuntu:bionic

USER root

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs

RUN node -v

RUN npm install -g yarn@1.22.10

WORKDIR /app

COPY package.json yarn.lock /app/

RUN yarn install --frozen-lockfile

# RUN yarn add segfault-handler

COPY . /app

ENTRYPOINT ["/bin/sh", "-c", "yarn test"]
