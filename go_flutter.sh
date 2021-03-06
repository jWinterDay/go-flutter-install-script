#!/bin/bash

if [ "$1" = "run" ]; then
    hover run

    exit $?
fi

if [ "$1" = "install_linux" ]; then
    sudo apt install golang-go
    GO111MODULE=on go get -u -a github.com/go-flutter-desktop/hover

    # don't remember add line below to .bashrc
    export PATH=$PATH:$HOME/go/bin

    sudo apt-get install libgl1-mesa-dev
    sudo apt-get install xorg-dev

    echo $(hover version)
    echo $(go version)

    exit $?
fi

if [ "$1" = "install_mac" ]; then
    brew install golang
    GO111MODULE=on go get -u -a github.com/go-flutter-desktop/hover
    
    # don't remember add line below to .bashrc
    export PATH=$PATH:$HOME/go/bin

    echo $(hover version)
    echo $(go version)

    exit $?
fi

echo "./start.sh COMMAND
        run             - run app
        install_linux   - install go and hover on ubuntu
        install_mac     - install go and hover on macos
"
