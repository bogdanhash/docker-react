FROM node:alpine as builder

ENV http_proxy http://10.125.115.11:3128
ENV https_proxy http://10.125.115.11:3128

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

