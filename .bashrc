# git
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"

__build_prompt() {
    local EXIT=$?
    local EXIT_PAD

    if [ $EXIT -lt 10 ]; then
        EXIT_PAD=" $EXIT "
    else
        EXIT_PAD=$(printf "%3d" $EXIT)
    fi

    local exit_part

    if [ $EXIT -eq 0 ]; then
        exit_part="[$EXIT_PAD]"
    elif [ $EXIT -eq 130 ]; then
        exit_part="\[\033[0;93m\][$EXIT_PAD]\[\033[0m\]"
    else
        exit_part="\[\033[01;91m\][$EXIT_PAD]\[\033[0m\]"
    fi

    # Build complete PS1 with all escape sequences properly delimited
    PS1="${exit_part} \${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0;36m\]\$(__git_ps1)\[\033[0m\] \$ "
}

PROMPT_COMMAND="__build_prompt"

# alias
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
