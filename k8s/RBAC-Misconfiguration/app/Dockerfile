FROM node:15.13.0-alpine

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN apk add --no-cache curl && \
    adduser -D appuser && \
    chown -R appuser /usr/src/app && \
    npm ci --only=production && \
    npm audit --production && \
    rm -rf /tmp/*

USER appuser

COPY . .

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:8080/ || exit 1

CMD ["npm", "start"] 
