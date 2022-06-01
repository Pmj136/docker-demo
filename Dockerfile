FROM node:alpine as builder
WORKDIR /app
COPY . ./dockerdemo
WORKDIR /app/dockerdemo
RUN npm i -g pnpm && pnpm i && pnpm build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=0 /app/dockerdemo/dist .
EXPOSE 80