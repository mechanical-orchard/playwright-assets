# A Server for Playwright Test Assets

## Usage

Unless you're doing development on this project (in which case, see "Contributing" below), you probably want to run the container along the lines of:

```shell
export WEBSERVER_PORT=3002

# prerequisite:
# docker network create playwright

docker run -it --rm \
  --network playwright \
  --network-alias playwright-assets \
  -e WEBSERVER_PORT \
  -p ${WEBSERVER_PORT}:${WEBSERVER_PORT} \
  -d \
  geometer/playwright-assets:latest
```

## Licenses

This project carries the ISC License. The assets are acquired from [microsoft/playwright](https://github.com/microsoft/playwright), which uses the MIT License (copied here, per the license terms).

## Contributing

To make updates to the assets pulled from Playwright and embedded here, try the following:

```shell
git remote add --fetch --master master --no-tags playwright https://github.com/microsoft/playwright.git
git rm -r assets
git read-tree --prefix=assets -u playwright/master:tests/assets
```

To run the server and build the image, see `bin/p-run` and `bin/p-build`, respectively. Note that when running the server in Docker, a prerequisite is `docker network create playwright`. This is in support of running [`playwright-proxy`](https://github.com/geometerio/playwright-proxy) in the same user-defined bridge network with the ability to reach the assets server for test runs (in `transport: websocket` mode).
