FROM node:18.20.3-buster-slim

WORKDIR /usr/app

COPY export.sh /export.sh

ENTRYPOINT ["/export.sh"]
