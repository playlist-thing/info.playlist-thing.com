FROM node:26-alpine AS dependencies

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

FROM node:26-alpine AS build

WORKDIR /app
COPY . .
COPY --from=dependencies /app/node_modules ./node_modules
RUN npm run build

FROM nginx:1.31.1-alpine AS app

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build /app
