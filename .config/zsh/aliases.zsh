# ~/.config/zsh/aliases.zsh


# --- eza
if command -v eza >/dev/null 2>&1; then
    alias ls="eza --icons --git -ah"
else
    alias ls="ls -A"
fi

if command -v tree >/dev/null 2>&1; then
    alias tree="eza --tree --icons --git"
else
    alias tree="tree"
fi

# --- quick cd
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

alias calc='node'
alias h='history'
