#!/usr/bin/env bash

DARTBIN=/usr/lib/dart/bin
LIST_URL="https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list"

if [[ $(command -v protoc-gen-dart) != "" ]]; then
  sudo apt-get update
  sudo apt-get install apt-transport-https
  sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
  sudo sh -c "wget -qO- ${LIST_URL} > /etc/apt/sources.list.d/dart_stable.list"
  sudo apt-get update
  sudo apt-get install dart
  export PATH="$PATH:${DARTBIN}"
  export_l="export PATH=\"${PATH}:${DARTBIN}:${HOME}/.pub-cache/bin\""
  echo "${export_l}" >> ~/.profile
  export PATH="${PATH}:${DARTBIN}"
  pub global activate protoc_plugin
  export PATH=${PATH}
else
  echo "SKIP: protoc-gen-dart is already installed"
fi