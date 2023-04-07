FROM mcr.microsoft.com/playwright:focal

LABEL description "Playwright assets server"
LABEL version     "1.32.0"
LABEL maintainer  "corey@mechanical-orchard.com"

WORKDIR /usr/local/playwright

COPY    ["package.json", "package-lock.json", "pkg", "./"]
# TODO: double-check whether we need to skip the browser installs.
RUN     npm install --production
CMD     ["npm", "start"]
