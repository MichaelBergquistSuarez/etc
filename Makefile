# Makefile: Deploys links in all the right places.
# P.C. Shyamshankar <sykora@lucentbeing.com>

all: git irssi vim x xmonad zsh

git:
	rm -rf ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

irssi:
	rm -rf ~/.irssi
	ln -s `pwd`/irssi ~/.irssi
	cp ~/.irssi/config.safe ~/.irssi/config

vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc

x:
	rm -rf ~/.xinitrc
	ln -s `pwd`/x/xinitrc ~/.xinitrc

xmonad:
	rm -rf ~/.xmonad
	ln -s `pwd`/xmonad ~/.xmonad

zsh:
	rm -rf ~/.zsh ~/.zshrc
	ln -s `pwd`/zsh ~/.zsh
	ln -s `pwd`/zsh/zshrc ~/.zshrc
