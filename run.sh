#!/usr/bin/env bash

DIMG=$(basename "$(pwd)")
docker kill ${DIMG}
docker rm ${DIMG}
echo "Building image ${DIMG}:"
docker build -t "${DIMG}" .
docker run --name "${DIMG}" "${DIMG}"
