# Development Environment Setup

This repository contains a set of dotfiles and an Ansible playbook for setting up a development environment. The provided `setup.sh` script installs Ansible, updates the package list, and executes the Ansible playbook to configure your system according to the dotfiles in this repository.

## `setup.sh` Script

The `setup.sh` script automates the setup process by performing the following steps:

1. **Updates Package List**: Runs `apt update` if necessary.
2. **Installs Ansible**: Installs Ansible if it is not already installed.
3. **Executes Ansible Playbook**: Runs the `playbook.yml` to configure your system using the dotfiles.

### Usage

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x setup.sh
   ```

3. **Run the Script**:
   ```bash
   ./setup.sh
   ```

This will set up your development environment according to the configuration specified in `playbook.yml` and the dotfiles provided in the `dotfiles` directory.

## Playbook Configuration

The `playbook.yml` file is an Ansible playbook that manages the configuration of your system. It includes tasks to create symbolic links for dotfiles, install necessary packages, and configure your environment.
