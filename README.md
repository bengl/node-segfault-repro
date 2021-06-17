steps to repro 16.3.0:
- `yarn install`
- `yarn docker:build`
- `yarn docker:run`

Switching entrypoints in [./Dockerfile](./Dockerfile) to node-nightly seems to work.

### notes from @bengl

The `yarn install` outside docker is unnecessary.

To get a shell where you can debug, do `npm run docker:bash` or yarn equivalent.

Once inside, do:

```
# node 16
llnode -- /usr/bin/node node_modules/jest/bin/jest.js --detectOpenHandles

# node nightly
llnode -- /usr/lib/node_modules/node-nightly/node-nightly/bin/node node_modules/jest/bin/jest.js --detectOpenHandles
```
