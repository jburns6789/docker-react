#build phase

FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- the location of the source code

FROM nginx  
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#COPY --from=builder /app/build /usr/share/nginx/html <--- taking the source code from 
#builder where it was created previously, creating and nginx container and serving the
#code by putting it in the correct nginx directory to serve the static content
