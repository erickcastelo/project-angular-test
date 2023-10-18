FROM node:18.13.0-alpine AS build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM nginx:1.24.0-alpine

COPY --from=build /app/dist/project-angular-test/ /usr/share/nginx/html

EXPOSE 80
