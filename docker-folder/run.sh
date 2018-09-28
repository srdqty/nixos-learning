#!/usr/bin/env bash

nix-build ./docker-image.nix --out-link docker-image.tar.gz

docker load -i docker-image.tar.gz

docker run --rm folder-in-docker /my-folder
