Install
=======

Clone repo

    git clone https://github.com/bekbulatov/.home.git ~/.home

Create symlinks

	ln -s ~/.home/.bashrc_aliases    ~/.bashrc_aliases
	ln -s ~/.home/.bashrc_custom     ~/.bashrc_custom
	ln -s ~/.home/.bashrc_functions  ~/.bashrc_functions
	ln -s ~/.home/bin                ~/bin
	ln -s ~/.home/.config            ~/.config
	ln -s ~/.home/.django-completion ~/.django-completion
	ln -s ~/.home/.git-completion    ~/.git-completion
	ln -s ~/.home/.gitconfig         ~/.gitconfig
	ln -s ~/.home/.gitignore         ~/.gitignore
	ln -s ~/.home/.git-prompt        ~/.git-prompt
	ln -s ~/.home/.grc               ~/.grc
	ln -s ~/.home/.grcat             ~/.grcat
	ln -s ~/.home/grc.conf           ~/grc.conf
	ln -s ~/.home/.my.cnf            ~/.my.cnf
	ln -s ~/.home/.pythonstartup     ~/.pythonstartup
	ln -s ~/.home/.screenrc          ~/.screenrc
	ln -s ~/.home/sublime-text-2     ~/sublime-text-2
	ln -s ~/.home/.tmux.conf         ~/.tmux.conf
	ln -s ~/.home/.vimrc             ~/.vimrc

Put this line in the end of `~/.bash_profile`

    [ -f ~/.bashrc_custom ] && source ~/.bashrc_custom

Read it

    . ~/.bash_profile

VIM plugins setup

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
