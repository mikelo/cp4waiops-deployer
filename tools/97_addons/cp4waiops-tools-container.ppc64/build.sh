#!/bin/bash

export CONT_VERSION=2.0

# Build Production AMD64
podman buildx build --platform linux/ppc64 -t quay.io/michele_orlandi_it/cp4waiops-tools:$CONT_VERSION --load .
podman push quay.io/michele_orlandi_it/cp4waiops-tools:$CONT_VERSION

