# Ultraviolet test image; upstream source pinned for reproducibility.
FROM node:24-alpine

RUN apk add --no-cache git python3 make g++
RUN npm install --global corepack@latest
WORKDIR /app

# Pull the official application (including its public assets and license).
ARG ULTRAVIOLET_REF=a1762248768730d06ffa5a652345aeef7126ab63
RUN git clone https://github.com/titaniumnetwork-dev/Ultraviolet-App.git /app \
    && git checkout "$ULTRAVIOLET_REF" \
    && rm -rf .git

RUN corepack enable && pnpm install --frozen-lockfile
ENV NODE_ENV=production PORT=3000
EXPOSE 3000
CMD ["node", "src/index.js"]
