# ~/.config/zsh/.zshrc


# --- Config files
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/prompt.zsh"

bindkey -e

# --- Edit command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# --- Chpwd
autoload -Uz add-zsh-hook
add-zsh-hook chpwd function() {
    ls
}

# --- History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# --- Shell
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# --- Completion
autoload -Uz compinit

compinit -d "$XDG_CACHE_HOME/zsh/zshmpdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
