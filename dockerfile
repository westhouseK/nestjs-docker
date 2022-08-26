FROM node:16.17.0-slim AS build

WORKDIR /tmp

COPY ./app ./

RUN yarn install
RUN yarn build


FROM node:16.17.0-slim

WORKDIR /usr/app

COPY --from=build /tmp/node_modules ./node_modules
COPY --from=build /tmp/dist ./dist
COPY --from=build /tmp/package.json ./

EXPOSE 3000

CMD ["yarn", "start:prod"]
