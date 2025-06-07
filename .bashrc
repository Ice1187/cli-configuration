# PS1
__exit_code() {
    local EXIT=$?
    if [ $EXIT -lt 10 ]; then
        local EXIT_PAD=" $EXIT "
    else
        local EXIT_PAD=$(printf "%3d" $EXIT)
    fi

    if [ $EXIT -eq 0 ]; then
        echo -e "[$EXIT_PAD]"  # White for success
    elif [ $EXIT -eq 130 ]; then
        echo -e "\033[0;93m[$EXIT_PAD]\033[00m"  # Yellow for SIGINT
    else
        echo -e "\033[01;91m[$EXIT_PAD]\033[00m"  # Red for failure
    fi
}

if [[ -f /etc/bash_completion.d/git-prompt ]]; then
    cp /etc/bash_completion.d/git-prompt ~/.git-prompt.sh
else
    wget -qO ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh
fi
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
PS1='$(__exit_code) ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;36m\]$(__git_ps1)\[\033[0m\033[49m\] \$ '

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
