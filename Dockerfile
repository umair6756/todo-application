# Docker file with official node image and its size is almost 430MB

# FROM node:22-alpine

# WORKDIR /app

# COPY package*.json .

# RUN npm install

# COPY . .

# RUN npm run build

# EXPOSE 3000

# CMD ["npm", "run", "preview"]







# Docker file with nginx and its size is almost 80MB



#  Stage 1: Build 
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: NGINX 
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]













# Docker file with busybox and its size is almost 7MB

# #  Stage 1: Build 
# FROM node:22-alpine AS builder
# WORKDIR /app
# COPY package*.json ./
# RUN npm ci
# COPY . .
# RUN npm run build

# # Stage 2: Serve with BusyBox 
# FROM busybox:latest
# WORKDIR /www
# COPY --from=builder /app/dist .
# EXPOSE 8080
# CMD ["busybox", "httpd", "-f", "-p", "8081"]
