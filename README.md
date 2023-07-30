# grocy-rpi
Docker image of grocy for raspberry pi

## About

This project uses the default grocy application and wrapps it into an armv7 capable docker container. This is done by using an ubuntu instance with 
apache2 installed and build for arm devices.
Therefore, it will be possible to run grocy within a docker container on your raspberry pi.

## Docker

```sh
docker pull ghcr.io/mathisburger/grocy-rpi:latest
```
