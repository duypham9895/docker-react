FROM node:18-alpine as builder
WORKDIR /usr/app
COPY package*.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx:1.23.2-alpine
COPY --from=builder /usr/app/dist /usr/share/nginx/html
