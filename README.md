# dotfiles

> Config files to set up my personal environment how I like it.

<p align="center">
  <img src="assets/rEM1ASC.png" alt="dotfiles">
</p>

## Requirements

- [`chezmoi`](https://github.com/twpayne/chezmoi)

## Install

```shell
cd ${HOME}

# chezmoi
curl -fsSL https://get.chezmoi.io/lb | sh -s
~/.local/bin/chezmoi init rwanyoike/dotfiles
~/.local/bin/chezmoi apply
rm ~/.local/bin/chezmoi

# nix
curl -fsSL https://install.determinate.systems/nix https://install.determinate.systems/nix | sh -s -- install --nix-build-user-count 5
nix profile install path:${HOME}/.local/share/chezmoi/packages/nix

# atuin
atuin login

# zsh
sudo chsh -s $(which zsh) <USER>
```

### macOS

```shell
# Command Line Tools
xcode-select --install

# homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -c
```

### Crostini

```shell
# flatpak
flatpak remote-add --if-not-exists –user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
cat ~/.local/share/chezmoi/packages/flatpak.txt | xargs flatpak install -y
```
