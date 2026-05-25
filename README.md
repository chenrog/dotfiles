# dotfiles

Personal macOS dotfiles intended to make a new machine usable with a small number of repeatable steps.

The repository is organized as Stow packages. Each top-level directory mirrors paths relative to `$HOME`, for example `neovim/.config/nvim` links to `~/.config/nvim`.

## Setup

Install Xcode Command Line Tools first if this is a fresh macOS install:

```sh
xcode-select --install
```

Then from this repository:

```sh
make install
```

The Makefile installs Homebrew if needed, runs `brew bundle`, initializes supported submodules, installs Oh My Zsh and third-party shell plugins if needed, installs `vim-plug` for Neovim if needed, and stows the current packages into `$HOME`. The `Brewfile` is currently a snapshot of this machine's Homebrew-managed tools. It is intentionally broad and should be pared down over time.

Raycast is installed by `Brewfile`, but its local app state is not stowed or tracked.
Spicetify CLI is installed by `Brewfile`, but the current Spicetify config tree is local app state and is not stowed or tracked.

Useful targets:

```sh
make help
make check
make bundle
make oh-my-zsh
make vim-plug
make stow
```

## Cursor

Cursor should be installed, not synced. The desktop app is included in `Brewfile` as a Homebrew cask, so `brew bundle` should install it on a new machine.

Cursor's GitHub repository points users to the Cursor website for the editor download; it does not provide an official desktop install script. Cursor does publish an install command for Cursor Agent/CLI:

```sh
curl https://cursor.com/install -fsS | bash
cursor-agent --version
```

Keep `~/.cursor`, `~/.vscode`, and installed extension directories out of this repository. If editor sync becomes useful later, prefer a small manifest of settings/extensions over checked-in app state.

On this laptop, `~/.cursor` and `~/.vscode` are local symlinks for Cursor/VS Code state. For now they should point to local directories under `~/Library/Application Support/Cursor/Home`, not back into this repository and not into `/Applications/Cursor.app`. A future pass can decide which small settings or extension manifests belong in dotfiles.

## Notes

- Secrets, credentials, histories, editor caches, and generated app state should not be tracked.
- Oh My Zsh is installed by `make oh-my-zsh`; this repository tracks `.zshrc` and small custom snippets/plugins, not the full Oh My Zsh tree.
