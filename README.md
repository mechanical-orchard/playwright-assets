# A Server for Playwright Test Assets

## Usage

Unless you're doing development on this project (in which case, see "Contributing" below), you probably want to run the container along the lines of:

```shell
export WEBSERVER_PORT=4002

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

If you are developing on [playwright-elixir](https://github.com:geometerio/playwright-elixir), this package is pulled in as a dependency there. Nothing to do unless you are updating this package itself (see "Contributing" below).

## Licenses

This project carries the ISC License. The assets are acquired from [microsoft/playwright](https://github.com/microsoft/playwright), which uses the Apache License (copied here, per the license terms).

## Contributing

To make updates to the assets pulled from Playwright and embedded here, try the following:

```shell
# once...
git remote add --fetch --no-tags playwright https://github.com/microsoft/playwright.git

branch="release-1.17"
git fetch playwright
git rm -r priv/assets
git read-tree --prefix=priv/assets -u playwright/${branch}:tests/assets
```

**NOTE: this might be out of date...**

To run the server and build the image, see `bin/p-run` and `bin/p-build`, respectively. Note that when running the server in Docker, a prerequisite is `docker network create playwright`. This is in support of running [`playwright-proxy`](https://github.com/geometerio/playwright-proxy) in the same user-defined bridge network with the ability to reach the assets server for test runs (in `transport: websocket` mode).
