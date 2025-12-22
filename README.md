# dotfiles

Personal setup files managed by `chezmoi`.

<p align="center">
  <img src="assets/rEM1ASC.png" alt="dotfiles">
</p>

## Preparation

If you are on macOS, install `git` and other basic tools needed for setup.

```shell
# Install macOS Command Line Tools
xcode-select --install
```

## Setup

### Install `chezmoi`

Install `chezmoi` first. Use the official guide: [Install chezmoi](https://www.chezmoi.io/install).

### Apply dotfiles

Use these commands to setup your environment:

```shell
# Initialize and get dotfiles
chezmoi init github.com/<USER>/<REPO>

# Apply all configurations
chezmoi apply

```

## Tools

### Nix

1. Install Nix using the Determinate Nix guide: [Determinate Nix Installer](https://docs.determinate.systems/determinate-nix/).
1. Install packages listed:
    ```shell
    nix profile add path:${HOME}/.local/share/chezmoi/packages/nix
    ```

### Shell

Set up your shell and command history.

```shell
# Set Zsh as default shell
sudo chsh -s $(which zsh) <USER>

# Log in to Atuin (history sync)
atuin login
```
### macOS

Install Homebrew using the official guide: [Install Homebrew](https://brew.sh/).

## Other

### Crostini

Install Flatpak apps:

```shell
# Add Flathub source
flatpak remote-add --if-not-exists –user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install list of apps
cat ~/.local/share/chezmoi/packages/flatpak.txt | xargs flatpak install -y
```
