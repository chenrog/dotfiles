SHELL := /bin/sh

STOW_PACKAGES := aerospace htop iterm neovim oh-my-zsh p10k zprofile zsh zshenv
CATPPUCCIN_SUBMODULE := iterm/.config/iterm2/themes/catppuccin

.DEFAULT_GOAL := help

.PHONY: help install homebrew bundle submodules oh-my-zsh vim-plug stow check doctor update unstow

help:
	@printf '%s\n' \
		'Targets:' \
		'  make install     Install Homebrew, packages, OMZ, vim-plug, and stow dotfiles' \
		'  make homebrew    Install Homebrew if it is missing' \
		'  make bundle      Run brew bundle with this repo Brewfile' \
		'  make submodules  Initialize/update repo submodules used by setup' \
		'  make oh-my-zsh   Install Oh My Zsh and third-party plugins if missing' \
		'  make vim-plug    Install vim-plug for Neovim if missing' \
		'  make stow        Stow dotfile packages into $$HOME' \
		'  make check       Simulate stowing dotfile packages' \
		'  make doctor      Run setup health checks' \
		'  make update      Update Homebrew metadata, Brewfile deps, and submodules' \
		'  make unstow      Remove stowed dotfile package links'

install: homebrew bundle submodules oh-my-zsh vim-plug stow

homebrew:
	@scripts/ensure-homebrew

bundle: homebrew
	@scripts/brew bundle --file "$(CURDIR)/Brewfile"

submodules:
	@git submodule update --init --recursive -- "$(CATPPUCCIN_SUBMODULE)"

oh-my-zsh:
	@scripts/install-oh-my-zsh

vim-plug:
	@scripts/install-vim-plug

stow:
	@stow -d "$(CURDIR)" -t "$$HOME" $(STOW_PACKAGES)

check:
	@stow --simulate -d "$(CURDIR)" -t "$$HOME" $(STOW_PACKAGES)

doctor:
	@scripts/doctor

update: homebrew
	@scripts/brew update
	@scripts/brew bundle --file "$(CURDIR)/Brewfile"
	@git submodule update --init --recursive --remote -- "$(CATPPUCCIN_SUBMODULE)"

unstow:
	@stow -D -d "$(CURDIR)" -t "$$HOME" $(STOW_PACKAGES)
