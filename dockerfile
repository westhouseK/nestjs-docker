FROM node:16.17.0 AS dist

WORKDIR /tmp

COPY ./app ./

RUN yarn install \
    && yarn build


FROM node:16.17.0 AS module

WORKDIR /tmp

COPY ./app ./

RUN yarn install --prod


FROM node:16.17.0-alpine

WORKDIR /usr/app

COPY --from=dist /tmp/dist ./dist
COPY --from=module /tmp/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "dist/main"]