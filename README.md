# A Server for Playwright Test Assets

## Usage

Unless you're doing development on this project (in which case, see "Contributing" below), you probably want to run the container along the lines of what is found in `${REPO}/bin/dev.d/docker.sh`. And, assuming the project has been bootstrapped (see below), a Docker container for the server may be build and run as follows:

```shell
dev docker build
dev docker run
```

If you are developing on [playwright-elixir](https://github.com:geometerio/playwright-elixir), this package is pulled in as a dependency there. Nothing to do unless you are updating this package itself (see "Contributing" below).

## Licenses

This project carries the ISC License. The assets are acquired from [microsoft/playwright](https://github.com/microsoft/playwright), which uses the Apache License (copied here, per the license terms).

## Bootstrapping

```shell
brew bundle   # and ensure packages are set up (e.g., `asdf` needs shell integration)
direnv allow  # add `${REPO}/bin` to $PATH, etc.
dev setup     # see `${REPO}/bin/dev.d/setup.sh` for details
```

## Contributing

To make updates to the assets pulled from Playwright and embedded here, try the following:

```shell
# once...
git remote add --fetch --no-tags playwright https://github.com/microsoft/playwright.git

branch="release-1.18"
git fetch playwright
git rm -r priv/assets
git read-tree --prefix=priv/assets -u playwright/${branch}:tests/assets

# Remove selenium-grid asset path. It's WAY too big, and not useful outside of
# the Node.js Playwright.
rm -rf priv/assets/selenium-grid
```
