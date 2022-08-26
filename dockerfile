FROM node:16.17.0

WORKDIR /usr/app

COPY ./app ./

RUN yarn install
RUN yarn build

EXPOSE 3000

CMD ["yarn", "start:prod"]