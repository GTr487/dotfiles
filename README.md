# dottools.sh

`dottools.sh` is a Bash script designed to set up a development environment on Linux by installing essential tools and managing custom configuration files (dotfiles).

## Usage

```bash
./dottools.sh [OPTIONS]
```

### Description

This script installs key development tools like i3, Rofi, Polybar, Kitty, and Tmux, and manages dotfiles by copying them to and from specified locations.

### Options

- `-h, --help`  
  Display this help message and exit.

- `-s, --setup`  
  Install and configure the base development environment.

- `-i, --install`  
  Install all required dependencies (i3, Rofi, Polybar, Kitty, Tmux).

- `-g, --get`  
  Retrieve dotfiles from the source paths specified in the `.include` file.

- `-p, --put`  
  Deploy dotfiles to the destination paths specified in the `.include` file.

### Notes

- You may need to run this script as a superuser (`sudo`).

## Dependencies

- `apt`: This script uses the `apt` package manager to install software.
- `sudo`: Required for some installation operations.

## Installation of Dependencies

To run this script, the following tools must be installed:

- `bash`
- `sudo`
- `apt`

### Example Execution

```bash
sudo ./dottools.sh --setup
```

### The `.include` File

The `.include` file is a plain text file that specifies the configuration files (dotfiles) and their associated paths. This file is necessary for the script to know which files to copy and where to find or place them.

#### Format of the `.include` File

Each line in the `.include` file should contain two fields separated by a space or tab:

1. **File Name**: A label or name that identifies the file or group of files to be managed.
2. **File Path**: The full or relative path to the configuration file on the filesystem.

#### Example of `.include`

```plaintext
bashrc    ~/.bashrc
vimrc     ~/.vimrc
i3config  ~/.config/i3/config
kitty     ~/.config/kitty/*
tmux      ~/.tmux.conf
```

- **`bashrc`**: The `.bashrc` file located in the user's home directory.
- **`vimrc`**: The `.vimrc` file located in the user's home directory.
- **`i3config`**: The i3 configuration file located at `~/.config/i3/config`.
- **`kitty`**: All files in the `~/.config/kitty/` directory.
- **`tmux`**: The Tmux configuration file located in the user's home directory.

### Important Notes

- Paths can include the `~` character to represent the user's home directory.
- To specify multiple files within a directory, you can use a wildcard (`*`).
- Make sure there are no extra spaces at the end of each line and that the names and paths are correct to avoid errors during script execution.

