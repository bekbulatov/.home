all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

install-git:
	ln -sf ~/.home/.gitconfig ~/.gitconfig
	ln -sf ~/.home/.gitignore ~/.gitignore
	mkdir -p ~/bin
	ln -sf ~/.home/bin/diff-highlight ~/bin/diff-highlight
	echo "[ -f ~/.home/.bashrc_git ] && source ~/.home/.bashrc_git" >> ~/.bashrc

uninstall-git:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
	rm -f ~/bin/diff-highlight
	[ "$(ls -A ~/bin)" ] || rm -r ~/bin
	sed -i '/\.bashrc_git/d' ~/.bashrc

install-vim:
	ln -sf ~/.home/.vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo | echo | vim +PluginInstall +PluginUpdate +qall &>/dev/null

uninstall-vim:
	rm -f ~/.vimrc
	rm -rf ~/.vim

install-tmux:
	ln -sf ~/.home/.tmux.conf ~/.tmux.conf

uninstall-tmux:
	rm -f ~/.tmux.conf

install-screen:
	ln -sf ~/.home/.screenrc ~/.screenrc

uninstall-screen:
	rm -f ~/.screenrc

install-mysql:
	ln -sf ~/.home/.my.cnf ~/.my.cnf
	ln -sf ~/.home/.grc ~/.grc
	ln -sf ~/.home/.grcat ~/.grcat
	ln -sf ~/.home/grc.conf ~/grc.conf
	mkdir -p ~/bin
	ln -sf ~/.home/bin/grc ~/bin/grc
	ln -sf ~/.home/bin/grcat ~/bin/grcat

uninstall-mysql:
	rm -f ~/.my.cnf
	rm -f ~/.grc
	rm -f ~/.grcat
	rm -f ~/grc.conf
	rm -f ~/bin/grc
	rm -f ~/bin/grcat
	[ "$(ls -A ~/bin)" ] || rm -r ~/bin

install-python:
	echo "[ -f ~/.home/.bashrc_python ] && source ~/.home/.bashrc_python" >> ~/.bashrc

uninstall-python:
	sed -i '/\.bashrc_python/d' ~/.bashrc

.PHONY: all           \
	install-git       \
	uninstall-git     \
	install-vim       \
	uninstall-vim     \
	install-tmux      \
	uninstall-tmux    \
	install-screen    \
	uninstall-screen  \
	install-mysql     \
	uninstall-mysql   \
	install-python    \
	uninstall-python

# TODO:
# ln -sf ~/.home/.bashrc_aliases    ~/.bashrc_aliases
# ln -sf ~/.home/.bashrc_custom     ~/.bashrc_custom
# ln -sf ~/.home/.bashrc_functions  ~/.bashrc_functions
# ln -sf ~/.home/.config            ~/.config
# ln -sf ~/.home/sublime-text-2     ~/sublime-text-2
