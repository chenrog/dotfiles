# dotfiles

Personal macOS dotfiles intended to make a new machine usable with a small number of repeatable steps.

The repository is organized as Stow packages. Each top-level directory mirrors paths relative to `$HOME`.

## Setup

Install Xcode Command Line Tools first if this is a fresh macOS install:

```sh
xcode-select --install
```

Then from this repository:

```sh
make install
```

The default `Brewfile` is the personal baseline. `Brewfile.work` is a backup of the broader work-laptop setup; use it manually with `scripts/brew bundle --file Brewfile.work` until this repo has separate work/personal branches or profiles.

Useful targets:

```sh
make help
make check
make doctor
make update
make bundle
make oh-my-zsh
make vim-plug
make stow
```
