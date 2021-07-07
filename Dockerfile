# Multi Step Process with Docker
# BUILD PHASE
FROM node:alpine as builder

WORKDIR "/app"

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build will be the output of the run 

# RUN PHASE
FROM nginx:alpine
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html

# nGINX starts automatically with default command