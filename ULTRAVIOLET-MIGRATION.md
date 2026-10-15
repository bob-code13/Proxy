# Ultraviolet migration test

This branch prepares an Ultraviolet-based replacement for the LinuxServer Chromium/Selkies container. It does not change the running Azure Web App.

## Build and test

```sh
docker build -t boberts-ultraviolet .
docker run --rm -p 3000:3000 boberts-ultraviolet
```

Visit http://localhost:3000 and test site loading, browsing in separate browser profiles, and WebSocket proxying.

## Azure deployment notes

- The current App Service points directly to `lscr.io/linuxserver/chromium:latest`. Editing this repository does **not** change that image.
- The existing GitHub workflow only builds a local Docker image. It does not publish an image or update Azure.
- Publish the tested image to a container registry and configure App Service to pull it; set `WEBSITES_PORT=3000` if required by the App Service configuration.
- Azure F1 capacity is limited: five concurrent users and performance are not guaranteed.
- The Ultraviolet upstream source is pinned in the Dockerfile for reproducibility. Review upstream licensing and security before making the proxy public.
