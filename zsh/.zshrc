# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_OPTS="--height=40% --border"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# "random" for random
# echo $RANDOM_THEME to know which
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto        # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"


# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# p10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# gvm is lazy-loaded via ~/.oh-my-zsh/custom/lazy-gvm.zsh
. "$HOME/.local/bin/env"

export GOPRIVATE=github.com/ROKT
export GONOSUMDB=github.com/ROKT


# nvm is lazy-loaded via ~/.oh-my-zsh/custom/lazy-nvm.zsh


# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/roger.chen/.docker/completions $fpath)
# compinit handled by oh-my-zsh
# End of Docker CLI completions


# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl helper
firstpodnamed() {
  kubectl get pods | grep "$1" | awk '{print $1}' | head -n 1
}

# Add my-rokt-jwt
export PATH="$HOME/code/rokt/my-rokt-jwt/bin:$PATH"

# ZSH settings
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZOXIDE_CMD_OVERRIDE="cd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	zsh-defer
	aliases
	#ag # `brew install the_silver_searcher`
	#colorize # install more stuff here
	copybuffer
	copyfile
	copypath
	docker
	extract
	git git-branch-save
	globalias
	#keychain # lots to do here
  	kubectl
	#macos # we don't really need the extra juice
	magic-enter
	#percol # seems like some setup required for advanced fzf style grep
	safe-paste
	#ssh
	#ssh-agent
	#tmux
	wd
	#zoxide
	zsh-interactive-cd
	# zsh-autosuggestions and zsh-syntax-highlighting are deferred (see below)
)

# cache compinit
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
	compinit -d ~/.zcompdump
else
	compinit -C -d ~/.zcompdump   # skip security check on warm runs
fi

ZSH_DISABLE_COMPFIX=true   # tells omz not to run compinit again
zstyle ':omz:alpha:lib:git' async-prompt no   # p10k handles async; avoid omz race in _omz_async_callback
source $ZSH/oh-my-zsh.sh

# fzf
eval "$(fzf --zsh)"
#zoxide
eval "$(zoxide init zsh --cmd cd)"

# Deferred plugins: load after first prompt for snappy startup.
# Order matters: autosuggestions before syntax-highlighting.
zsh-defer source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
zsh-defer source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

alias gcoi='git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout'
alias gai='git ls-files -m -o --exclude-standard | fzf --multi --preview "git diff --color=always {} 2>/dev/null || cat {}" | xargs -I{} git add {}'
alias gbdi='git branch --format="%(refname:short)" | grep -v "^$(git branch --show-current)$" | fzf -m --height=20% --reverse | xargs -r -n1 git branch -D'
alias tg='tengen'
alias yolo-claude='claude --dangerously-skip-permissions'

# claude editor
export EDITOR="nvim"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/dotfiles/p10k/.p10k.zsh ]] || source ~/dotfiles/p10k/.p10k.zsh

