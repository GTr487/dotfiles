#!/bin/bash

VERSION="1.1.0"

show_header() {
    echo -e "                                                              \n @@@@@@@@  @@@@@@@  @@@@@@@        @@@    @@@@@@   @@@@@@@@  \n@@@@@@@@@  @@@@@@@  @@@@@@@@      @@@@   @@@@@@@@  @@@@@@@@  \n!@@          @@!    @@!  @@@     @@!@!   @@!  @@@       @@!  \n!@!          !@!    !@!  @!@    !@!!@!   !@!  @!@      !@!   \n!@! @!@!@    @!!    @!@!!@!    @!! @!!    !@!!@!      @!!    \n!!! !!@!!    !!!    !!@!@!    !!!  !@!    !!@!!!     !!!     \n:!!   !!:    !!:    !!: :!!   :!!:!:!!:  !!:  !!!   !!:      \n:!:   !::    :!:    :!:  !:!  !:::!!:::  :!:  !:!  :!:       \n ::: ::::     ::    ::   :::       :::   ::::: ::   ::       \n :: :: :      :      :   : :       :::    : :  :   : :       \n                                                              "
}

show_version() {
    echo -e "--------------------------------------------------------\n                                                  v$VERSION\n--------------------------------------------------------"
}

detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo "Could not detect distro."
        exit 1
    fi
}

install_ansible_arch() {
    if ! command -v ansible &> /dev/null; then
        echo "# Installing Ansible on Arch Linux..."

        sudo pacman -Syu --noconfirm ansible
    else
        echo "# Ansible is already installed."
    fi
}

install_ansible_debian() {
    if ! command -v ansible &> /dev/null; then
        echo "# Installing Ansible on Debian based system..."

        sudo apt update
        sudo apt install -y ansible
    else
        echo "# Ansible is already installed."
    fi
}

execute_playbook() {
    echo "# Running $PLAYBOOK..."
    ansible-playbook -i localhost, -c local "$PLAYBOOK" --ask-become-pass
}

# MAIN
show_header
echo
show_version
echo
echo

detect_distro

case "$DISTRO" in
    arch)
        PLAYBOOK="playbooks/arch_playbook.yml"
        install_ansible_arch
        ;;
    ubuntu | debian)
        PLAYBOOK="playbooks/debian_playbook.yml"
        install_ansible_debian
        ;;
    *)
        echo "Unsupported distribution: $DISTRO"
        exit 1
        ;;
esac

execute_playbook
