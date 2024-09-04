# DOTFILES by GTr487

**DOTFILES by GTr487** is a project designed to automatically install and configure a development environment along with its dotfiles.

## Installation and Configuration

The project includes a script named `setup.sh` that automates the installation and configuration of the development environment. Below are the available options for running the script.

### Script Usage

#### Show Help

To get information on how to use the script, you can run it with the `-h` or `--help` options:

```bash
./setup.sh -h
```
or
```bash
./setup.sh --help
```

This will display the help and a description of the available options.

#### Install and Configure the Environment

To run the installation and configuration of the development environment, use the `-env` or `--environment` option:

```bash
./setup.sh -env
```
or
```bash
./setup.sh --environment
```

This command will perform the automated installation and configure the necessary dotfiles for your development environment.

#### Default Execution

If no arguments are provided to the script, it will display the same message as the `help` option:

```bash
./setup.sh
```

### Requirements

- **Bash**: Ensure you have a Bash-compatible environment to run the script.
