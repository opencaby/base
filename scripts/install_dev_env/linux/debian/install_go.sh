#!/usr/bin/env bash

if [[ $(command -v go) == ""  ]]; then
    sudo apt-get install golang-go
fi
