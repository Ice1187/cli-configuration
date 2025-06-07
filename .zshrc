# git in zsh: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz compinit && compinit -u  # -u becuase ecille share some stuff with main admin account
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

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

    PS1="[$EXIT_STR] %F{green}%3~%f%F{cyan}$(__git_ps1)%f "
}
precmd_functions+=(__set_prompt)

alias ls='ls --color'
alias grep='grep --color'
alias diff='diff --color'
alias gst='git status'
alias gbr='git branch'
alias gsw='git switch'
alias gco='git checkout'
alias gfe='git fetch'
alias glog='git log'
alias gdiff='git diff'
