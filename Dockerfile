FROM node:10.13.0-alpine

WORKDIR /blog
ADD . /blog

RUN apk update
RUN apk upgrade
RUN apk add --update --no-cache git yarn python gcc g++ make libc6-compat
RUN apk add vips-dev fftw-dev build-base --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --repository http://dl-3.alpinelinux.org/alpine/edge/main

RUN git submodule init
RUN git submodule update

RUN yarn global add knex-migrator grunt-cli ember-cli bower
RUN yarn setup

EXPOSE 2368

CMD ["yarn", "start"]
