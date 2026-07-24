# ~/.config/zsh/prompt.zsh


autoload -Uz vcs_info
setopt PROMPT_SUBST

# --- Git status
zstyle ':vcs_info:git:*' formats ' %F{#a8e0d3}(%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{#a8e0d3}(%b|%a%u%c)%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{#ee99a0}*%f'
zstyle ':vcs_info:git:*' stagedstr '%F{#f9e2af}+%f'
precmd() { vcs_info }

# --- Colors
C_SUCCESS='%F{#b8e3a1}'
C_ERROR='%F{#ee99a0}'

C_USER='%F{#fdeadc}'

C_SYMBOL='%F{#c7b0f0}'

C_RESET='%f'

PROMPT=" %(?.${C_SUCCESS}.${C_ERROR})%?${C_RESET} | ${C_USER}%n %~${C_RESET}\${vcs_info_msg_0_} ${C_SYMBOL}\$${C_RESET} "
