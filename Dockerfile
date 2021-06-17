FROM ubuntu:bionic

USER root

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g yarn@1.22.10

WORKDIR /app
COPY package.json yarn.lock /app/

RUN yarn install --frozen-lockfile

RUN node -v
RUN npm install --global node-nightly
RUN node-nightly
RUN node-nightly -v

RUN apt-get install -y lldb build-essential liblldb-6.0-dev

RUN npm i -g llnode

COPY . /app

# Fails on node entrypoint (v16.13.0) but works for node-nightly
# ENTRYPOINT ["/bin/sh", "-c", "node-nightly node_modules/jest/bin/jest.js --detectOpenHandles"]
ENTRYPOINT ["/bin/sh", "-c", "node node_modules/jest/bin/jest.js --detectOpenHandles"]
