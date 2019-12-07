#!/usr/bin/env bash

INSTALL_GOGO=0

go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
go get -u github.com/golang/protobuf/protoc-gen-go

if [[ ${INSTALL_GOGO} == 1 ]]; then
  go get -u github.com/gogo/protobuf/protoc-gen-gogofast
  go get -u github.com/gogo/protobuf/protoc-gen-gogofaster
  go get -u github.com/gogo/protobuf/protoc-gen-gogoslick
fi

