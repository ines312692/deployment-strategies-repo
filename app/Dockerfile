FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY src/ ./

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 8080
CMD ["node", "app-v1.js"]  # Change to app-v2.js for v2 builds