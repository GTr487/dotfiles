#!/bin/bash

SCRIPT="setup.sh"
VERSION="1.0.0"

show_header() {
  echo -e "                                                              \n @@@@@@@@  @@@@@@@  @@@@@@@        @@@    @@@@@@   @@@@@@@@  \n@@@@@@@@@  @@@@@@@  @@@@@@@@      @@@@   @@@@@@@@  @@@@@@@@  \n!@@          @@!    @@!  @@@     @@!@!   @@!  @@@       @@!  \n!@!          !@!    !@!  @!@    !@!!@!   !@!  @!@      !@!   \n!@! @!@!@    @!!    @!@!!@!    @!! @!!    !@!!@!      @!!    \n!!! !!@!!    !!!    !!@!@!    !!!  !@!    !!@!!!     !!!     \n:!!   !!:    !!:    !!: :!!   :!!:!:!!:  !!:  !!!   !!:      \n:!:   !::    :!:    :!:  !:!  !:::!!:::  :!:  !:!  :!:       \n ::: ::::     ::    ::   :::       :::   ::::: ::   ::       \n :: :: :      :      :   : :       :::    : :  :   : :       \n                                                              "
}

show_version() {
  echo -e "--------------------------------------------------------\n                                                  v$VERSION\n--------------------------------------------------------"
}

show_help() {
  echo "Usage: $SCRIPT [OPTIONS] [ARGUMENTS]"
  echo
  echo "Description:"
  echo "  This script is responsible for setting up the development environment."
  echo
  echo "Options:"
  echo "  -h, --help            Show this help message and exit."
  echo "  -env, --environment   Required argument to install and configure the base environment."
  echo
  echo "Note: You may need to run this script as a superuser."
  echo
  exit 0
}

install_i3() {
  echo "# i3 --------------------------- #"
  
  /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
  if [ $? -ne 0 ]; then
	  echo "Error: Failed to download keyring file."
	  exit 1
  fi

  sudo apt install -y ./keyring.deb
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install keyring package."
	rm -f keyring.deb
	exit 1
  fi

  echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

  sudo apt update
  if [ $? -ne 0 ]; then
	echo "Error: Failed to update the package index."
	rm -f keyring.deb
	exit 1
  fi

  sudo apt install -y i3
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install i3."
	rm -f keyring.deb
	exit 1
  fi

  rm -f keyring.deb
  echo "# i3 - Installation complete, and temporary files have been removed."

  mkdir -p ~/.config/i3
  cp dotfiles/i3.conf ~/.config/i3/config
  if [ $? -ne 0 ]; then
	echo "Error: Failed to copy config files."
	exit 1
  fi
  echo "# i3 - Configuration complete."

  echo
}

install_rofi() {
  echo "# Rofi ------------------------- #"

  sudo apt install -y rofi
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install Rofi."
	exit 1
  fi
  echo "# Rofi - Installation complete."

  mkdir -p ~/.config/rofi
  cp dotfiles/rofi.conf ~/.config/rofi/config.rasi
  if [ $? -ne 0 ]; then
	echo "Error: Failed to copy config files."
	exit 1
  fi
  echo "# Rofi - Configuration complete."

  echo
}

install_polybar() {
  echo "# Polybar ---------------------- #"

  sudo apt install -y polybar
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install Polybar."
	exit 1
  fi
  echo "# Polybar - Installation complete."

  mkdir -p ~/.config/polybar
  cp dotfiles/polybar.conf ~/.config/polybar/config
  if [ $? -ne 0 ]; then
	echo "Error: Failed to copy config files."
	exit 1
  fi
  echo "# Polybar - Configuration complete."

  echo
}

install_kitty() {
  echo "# Kitty ------------------------ #"

  sudo apt install -y kitty
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install Kitty."
	exit 1
  fi
  echo "# Kitty - Installation complete."

  mkdir -p ~/.config/kitty
  cp dotfiles/kitty.conf ~/.config/kitty/kitty.conf
  if [ $? -ne 0 ]; then
	echo "Error: Failed to copy config files."
	exit 1
  fi
  echo "# Kitty - Configuration complete."

  echo
}

install_tmux() {
  echo "# Tmux ------------------------- #"

  sudo apt install -y tmux
  if [ $? -ne 0 ]; then
	echo "Error: Failed to install Tmux."
	exit 1
  fi
  echo "source-file ~/.config/tmux/tmux.conf" > ~/.tmux.conf

  echo "# Tmux - Installation complete."

  mkdir -p ~/.config/tmux
  cp dotfiles/tmux.conf ~/.config/tmux/tmux.conf
  if [ $? -ne 0 ]; then
	echo "Error: Failed to copy config files."
	exit 1
  fi
  echo "# Tmux - Configuration complete."

  echo
}

setup_environment() {
  echo "Installing dependencies:"
  install_i3
  install_rofi
  install_polybar
  install_kitty 
  install_tmux
}



####################
####################

if [ "$#" -eq 0 ]; then
	show_help
	exit 1
else
	show_header
	echo
	show_version
	echo
	echo
fi
	

declare -A unique_args

for arg in "$@"; do
	unique_args["$arg"]=1
done


for arg in "${!unique_args[@]}"; do
	case "$arg" in
		-h|--help)
			show_help
			;;
		-env|--environment)
			setup_environment
			;;
	esac
done
