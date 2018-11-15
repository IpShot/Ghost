FROM node:10.13.0-alpine

WORKDIR /blog
ADD . /blog

RUN apk update
RUN apk upgrade
RUN apk add git
RUN apk add yarn

RUN git submodule init
RUN git submodule update

RUN yarn global add knex-migrator grunt-cli ember-cli bower
RUN yarn setup

EXPOSE 2368

CMD ["yarn", "start"]
