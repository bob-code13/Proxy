FROM shadowsocks/shadowsocks-libev:v3.3.5

# Configure environment for public routing
ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=80
ENV PASSWORD=BobertProxy123!
ENV METHOD=aes-256-gcm
ENV TIMEOUT=300

EXPOSE 80
