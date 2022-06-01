FROM node:alpine as builder
WORKDIR /app
COPY . ./vitedemo
WORKDIR /app/vitedemo
RUN npm i -g pnpm && pnpm i && pnpm build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=0 /app/vitedemo/dist .
EXPOSE 80