# zsh prompt doc: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Special-characters
setopt PROMPT_SUBST
__set_prompt () {
    local EXIT_CODE=$?
    local EXIT_STR=""
    # color
    if [[ $EXIT_CODE -eq 0 ]]; then
        EXIT_STR="$EXIT_CODE"
    elif [[ $EXIT_CODE -eq 130 ]]; then
        EXIT_STR="%F{yellow}$EXIT_CODE%f"
    else
        EXIT_STR="%F{red}$EXIT_CODE%f"
    fi
    # padding
    if [[ $EXIT_CODE -lt 10 ]]; then
        EXIT_STR=" $EXIT_STR "
    elif [[ $EXIT_CODE -lt 100 ]]; then
        EXIT_STR=" $EXIT_STR"
    fi

    PS1="[$EXIT_STR] %F{green}%3~%f %# "
}
precmd_functions+=(__set_prompt)

# git in zsh: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz compinit && compinit -u  # -u becuase ecille share some stuff with main admin account
autoload -Uz vcs_info
setopt prompt_subst
precmd_functions+=(vcs_info)
zstyle ':vcs_info:*' enable git  # cvs svn
zstyle ':vcs_info:git:*' use-simple true
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
# zstyle ':vcs_info:git:*' stagedstr 'S'
# zstyle ':vcs_info:git:*' unstagedstr 'U'
zstyle ':vcs_info:git:*' formats '%F{cyan}%b%f %F{yellow}%c%f %F{yellow}%u%f'  # this is vcs_info_msg_0_
RPROMPT='${vcs_info_msg_0_}'

alias ls='ls --color'
alias grep='grep --color'
alias diff='diff --color'
alias gst='git status'
alias gbr='git branch'
alias gsw='git switch'
alias gco='git checkout'
alias glog='git log'
alias gdiff='git diff'
