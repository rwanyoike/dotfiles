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
curl -sSf -L https://get.chezmoi.io/lb | sh -s
~/.local/bin/chezmoi init rwanyoike/dotfiles
~/.local/bin/chezmoi apply
# rm ~/.local/bin/chezmoi

# nix
curl -sSf -L https://install.determinate.systems/nix https://install.determinate.systems/nix | sh -s -- install --nix-build-user-count 5
nix profile install path:${HOME}/.local/share/chezmoi/packages/nix

# flatpak
flatpak remote-add --if-not-exists –user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
cat ~/.local/share/chezmoi/packages/flatpak.txt | xargs flatpak install -y

# mise
mise install
rustup component add rust-analyzer

# tldr
tldr –update

# atuin
atuin login -u <USER>
atuin sync

# zsh
sudo chsh -s /usr/bin/zsh <USER>
```
