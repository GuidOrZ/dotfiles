# ~/.zshenv


# --- XDG base directories
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# --- Editor
export EDITOR="nvim"
export VISUAL="nvim"

# --- GPG
export GPG_TTY=$(tty)

# --- PATH
export PATH="$HOME/.local/bin:$PATH"

# --- Pager
export MANPAGER='nvim +Man!'
