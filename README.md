steps to repro 16.3.0:
- `yarn install`
- `yarn docker:build`
- `yarn docker:run`

Switching entrypoints in [./Dockerfile](./Dockerfile) to node-nightly seems to work.