FROM lscr.io/linuxserver/chromium:latest

# Configure the container for Azure's web port
ENV PORT=80
EXPOSE 80

# Auto-start the browser interface engine
CMD ["/init"]
