# zsh prompt doc: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Special-characters
PROMPT="[%(?.%?.%(130?.%F{yellow}%?%f.%F{red}%?%f))] %F{green}%3~%f %# "

# git in zsh: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
setopt prompt_subst
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git  # cvs svn
zstyle ':vcs_info:git:*' formats '(%F{cyan}%b%f)'  # this is vcs_info_msg_0_
RPROMPT='${vcs_info_msg_0_}'

# git complete
autoload -Uz compinit && compinit
