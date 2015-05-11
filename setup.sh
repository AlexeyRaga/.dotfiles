#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATE="$( date +%s )"

mkdir -p ~/.config

function backup {
	if [ -f "$1" ] || [ -d "$1" ] ; then mv "$1" "$1.$DATE"; fi
}

function link {
	backup $2
	ln -s $1 $2
}

pushd $DIR

link "emacs.d", "~/.emacs.d"
link "dsh", "~/.dsh"
link "vim", "~/.vim"
link "config/powerline", "~/.config/powerline"
link "vimrc", "~/.vimrc"
link "tmux.conf", "~/.tmux.conf"
link "zshrc", "~/.zshrc"
link "ghci", "~/.ghci"

if[ -d "~/.oh-my-zsh/themes" ] ; then
	ln -s "oh-my-zsh/themes/alexey.zsh-theme" "~/.oh-my-zsh/themes/alexey.zsh-theme" ;
fi

popd