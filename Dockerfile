FROM mcr.microsoft.com/playwright:focal

LABEL description "Geometer automation grid: Playwright assets server"
LABEL version     "0.1.16"
LABEL maintainer  "atg@geometer.io"

WORKDIR /usr/local/geo-playwright

COPY    ["package.json", "package-lock.json", "pkg", "./"]
# TODO: double-check whether we need to skip the browser installs.
RUN     npm install --production

EXPOSE  3002
CMD     ["npm", "start"]
