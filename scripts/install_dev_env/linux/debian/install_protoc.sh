#!/usr/bin/env bash

PROTOC_VERSION=3.11.1
PROTOC_ZIP=protoc-${PROTOC_VERSION}-linux-x86_64.zip
PROTOC_PATH=/usr/local/bin/protoc

if [[ $(command -v protoc) == "" ]]; then
    curl -OL https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/${PROTOC_ZIP}
    sudo unzip -o ${PROTOC_ZIP} -d ${PROTOC_PATH}
    rm -f ${PROTOC_ZIP}
fi
