#!/bin/bash

VERSION="1.0.0"

show_header() {
    echo -e "                                                              \n @@@@@@@@  @@@@@@@  @@@@@@@        @@@    @@@@@@   @@@@@@@@  \n@@@@@@@@@  @@@@@@@  @@@@@@@@      @@@@   @@@@@@@@  @@@@@@@@  \n!@@          @@!    @@!  @@@     @@!@!   @@!  @@@       @@!  \n!@!          !@!    !@!  @!@    !@!!@!   !@!  @!@      !@!   \n!@! @!@!@    @!!    @!@!!@!    @!! @!!    !@!!@!      @!!    \n!!! !!@!!    !!!    !!@!@!    !!!  !@!    !!@!!!     !!!     \n:!!   !!:    !!:    !!: :!!   :!!:!:!!:  !!:  !!!   !!:      \n:!:   !::    :!:    :!:  !:!  !:::!!:::  :!:  !:!  :!:       \n ::: ::::     ::    ::   :::       :::   ::::: ::   ::       \n :: :: :      :      :   : :       :::    : :  :   : :       \n                                                              "
}

show_version() {
    echo -e "--------------------------------------------------------\n                                                  v$VERSION\n--------------------------------------------------------"
}

install_ansible() {
    if ! command -v ansible &> /dev/null; then
        echo "# Installing Ansible..."

        sudo apt install -y ansible
    else
        echo "# Ansible is already installed."
    fi
}

apt_update() {
    if [ ! -f /var/lib/apt/periodic/update-success-stamp ] || \
        [ $(find /var/lib/apt/periodic/update-success-stamp -mtime +1 -print) ]; then
            echo "# Running 'apt update'..."

            sudo apt update
        else
            echo "# 'apt update' is not necessary; it was run recently."
    fi
}

execute_playbook() {
    echo "# Running playbook..."
    ansible-playbook -i localhost, -c local playbook.yml --ask-become-pass
}

show_header
echo
show_version
echo
echo

apt_update
install_ansible
execute_playbook
