FROM node:16.6.2-stretch-slim

COPY export.sh /export.sh

ENTRYPOINT ["/export.sh"]