# Curl From Docker

Demonstrates how to make curl work with SSL when building a docker image.

```
nix-shell build-docker-image.nix
docker run curl-from-docker curl -L 'https://google.com'
```
