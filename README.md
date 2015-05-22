Install
=======

Clone repo

    git clone https://github.com/bekbulatov/.home.git ~/.home

Create symlinks

	cd ~/.home
	find -mindepth 1 -maxdepth 1 -not \( -name .git \) -not \( -name README \) -print -exec sh -c 'ln -s "$(readlink -e $@)" $(readlink -m $HOME/$@)' _ {} \;

Or manually

    ln -s ~/.home/.bashrc_functions ~/.bashrc_functions
    ln -s ~/.home/.bashrc_aliases ~/.bashrc_aliases
    ln -s ~/.home/.config ~/.config
    ln -s ~/.home/.my.cnf ~/.my.cnf
    ln -s ~/.home/.grcat ~/.grcat
    ln -s ~/.home/.bashrc_custom ~/.bashrc_custom
    ln -s ~/.home/.gitconfig ~/.gitconfig
    ln -s ~/.home/.git-prompt ~/.git-prompt
    ln -s ~/.home/.git-completion ~/.git-completion
    ln -s ~/.home/.pythonstartup ~/.pythonstartup
    ln -s ~/.home/.vimrc ~/.vimrc
    ln -s ~/.home/.django-completion ~/.django-completion
    ln -s ~/.home/.grc ~/.grc
    ln -s ~/.home/bin ~/bin
    ln -s ~/.home/.vim ~/.vim
    ln -s ~/.home/grc.conf ~/grc.conf
    ln -s ~/.home/sublime-text-2 ~/sublime-text-2
    ln -s ~/.home/.gitignore ~/.gitignore
    ln -s ~/.home/.screenrc ~/.screenrc
    ln -s ~/.home/.tmux.conf ~/.tmux.conf

Put this line in the end of `~/.bash_profile`

    [ -f ~/.bashrc_custom ] && source ~/.bashrc_custom

Read it

    . ~/.bash_profile
