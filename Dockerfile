FROM node:16.6.2-stretch-slim

WORKDIR /usr/app

COPY export.sh /export.sh

ENTRYPOINT ["/export.sh"]
