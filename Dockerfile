# Build stage
FROM node:22-alpine3.21 AS builder

RUN corepack enable && corepack prepare pnpm@10 --activate

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm run build

# Production stage
FROM nginx:1.27-alpine3.21

LABEL maintainer="Sanjay Soundarajan <contact@sanjaysoundarajan.dev>" \
  description="Scholar Data beta redirect page."

COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
