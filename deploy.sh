#!/bin/bash
set -e

backup_file() {
    local FILE=$1
    local BACKUP_FILE="$FILE.bak"

    if [[ -f $FILE ]]; then
        echo "[*] $FILE exists, backup to $BACKUP_FILE"
        cp $FILE $BACKUP_FILE
    fi
}

echo "[*] Deploying shell config"
if [[ $(basename $SHELL) == bash ]]; then
    backup_file ~/.bashrc
    wget -qO ~/.bashrc http://link.ice1187.com/bashrc
    source ~/.bashrc
elif [[ $(basename $SHELL) == zsh ]]; then
    backup_file ~/.zshrc
    wget -qO ~/.zshrc http://link.ice1187.com/zshrc
    source ~/.bashrc
else
    echo "[!] Unknown shell: $SHELL"
fi
echo "[+] Shell config deployed"

echo "[*] Deploying vim config"
backup_file ~/.vimrc
wget -qO ~/.vimrc http://link.ice1187.com/vimrc

# color scheme
mkdir -p ~/.vim/colors
wget -qO ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/Ice1187/vim-monokai/refs/heads/master/colors/monokai.vim

# tpope
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
if [[ ! -d commentary ]]; then
    git clone -q https://tpope.io/vim/commentary.git
    vim -es -u NONE -c "helptags commentary/doc" -c q
fi
if [[ ! -d surround ]]; then
    git clone -q https://tpope.io/vim/surround.git
    vim -es -u NONE -c "helptags surround/doc" -c q
fi
echo "[+] vim config deployed"

echo "[*] Deploying tmux config"
backup_file ~/.tmux.conf
wget -qO ~/.tmux.conf http://link.ice1187.com/tmux.conf
echo "[+] tmux config deployed"
