# Codex command runner uses non-interactive zsh, so expose GVM without loading full .zshrc.
if [[ -n "${CODEX_CI:-}" && -s "$HOME/.gvm/scripts/gvm" ]]; then
  source "$HOME/.gvm/scripts/gvm"
fi
