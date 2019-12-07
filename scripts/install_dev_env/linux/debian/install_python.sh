
if [[ $(command -v python3) == ""  ]]; then
    sudo apt install python3 python3-pip
fi

sudo pip3 install grpcio
sudo pip3 install grpcio-tools
sudo pip3 install googleapis-common-protos