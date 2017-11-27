all:
	@grep "^install" Makefile | cut -d ":" -f 1
	@echo "Select an appropriate install target from the above list"

define GITCONFIG_BODY
[include]
	path = ~/.home/git/.gitconfig
endef
export GITCONFIG_BODY
install-git:
	mkdir -p ~/bin
	ln -sf ~/.home/git/bin/diff-highlight ~/bin/diff-highlight
	echo '[ -f ~/.home/.bashrc_git ] && source ~/.home/.bashrc_git' >> ~/.bash_profile
	echo "$$GITCONFIG_BODY" >> ~/.gitconfig

uninstall-git:
	rm -f ~/bin/diff-highlight
	find ~/bin -type d -empty -delete
	sed -i '/\.bashrc_git/d' ~/.bash_profile
	tac ~/.gitconfig | sed '/\/\.home\/git\/\.gitconfig/I,+2 d' | tac > ~/.gitconfig.bak && mv ~/.gitconfig.bak ~/.gitconfig
	[ -s ~/.gitconfig ] || rm ~/.gitconfig

install-vim:
	ln -sf ~/.home/.vimrc ~/.vimrc
	[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
	ln -sf ~/.home/mysql/.my.cnf ~/.my.cnf
	ln -sf ~/.home/mysql/.grc ~/.grc
	ln -sf ~/.home/mysql/.grcat ~/.grcat
	ln -sf ~/.home/mysql/grc.conf ~/grc.conf
	mkdir -p ~/bin
	ln -sf ~/.home/mysql/bin/grc ~/bin/grc
	ln -sf ~/.home/mysql/bin/grcat ~/bin/grcat

uninstall-mysql:
	rm -f ~/.my.cnf
	rm -f ~/.grc
	rm -f ~/.grcat
	rm -f ~/grc.conf
	rm -f ~/bin/grc
	rm -f ~/bin/grcat
	find ~/bin -type d -empty -delete

install-python:
	mkdir -p ~/.config
	ln -sf ~/.home/python/.config/flake8 ~/.config/flake8
	echo '[ -f ~/.home/.bashrc_python ] && source ~/.home/.bashrc_python' >> ~/.bash_profile

uninstall-python:
	find ~/.config -type d -empty -delete
	sed -i '/\.bashrc_python/d' ~/.bash_profile

install-ruby:
	@type rbenv >/dev/null 2>&1 || { echo >&2 "rbenv is not installed. Aborting."; exit 1; }
	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
	git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
	rbenv alias --auto
	echo 'eval "$$(rbenv init -)"' >> ~/.bash_profile

uninstall-ruby:
	rm -rf ~/.rbenv/plugins/rbenv-gem-rehash
	rm -rf ~/.rbenv/plugins/rbenv-gem-aliases
	sed -i '/rbenv/d' ~/.bash_profile

install-bash:
	echo '[ -f ~/.home/.bashrc_bash ] && source ~/.home/.bashrc_bash' >> ~/.bash_profile

uninstall-bash:
	sed -i '/\.bashrc_bash/d' ~/.bash_profile

install-cheat:
	pip install --user cheat
	mkdir -p ~/opt
	git clone https://github.com/chrisallenlane/cheat.git ~/opt/cheat
	ln -sf ~/opt/cheat/bin/cheat ~/bin/cheat
	echo '[ -f ~/opt/cheat/cheat/autocompletion/cheat.bash ] && source ~/opt/cheat/cheat/autocompletion/cheat.bash' >> ~/.bash_profile

uninstall-cheat:
	mkdir -p ~/opt
	rm -rf ~/bin/cheat ~/opt/cheat
	sed -i '/cheat.bash/d' ~/.bash_profile
	find ~/opt ~/bin -type d -empty -delete
	pip uninstall cheat

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
	uninstall-python  \
	install-ruby      \
	uninstall-ruby    \
	install-bash      \
	uninstall-bash    \
	install-cheat     \
	uninstall-cheat
