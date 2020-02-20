#!/usr/bin/env bash

DIMG=$(basename "$(pwd)")
echo "Building image ${DIMG}:"
docker kill ${DIMG}
docker rm ${DIMG}
docker build -t "${DIMG}" .
docker run --name "${DIMG}" "${DIMG}"
