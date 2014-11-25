Install
=======

Clone repo

    git clone https://github.com/bekbulatov/.home.git ~/.home

Create symlinks

    find ~/.home -mindepth 1 -maxdepth 1 -not \( -name .git \) -not \( -name README \) -print -exec sh -c 'ln -s "$(readlink -e $@)" $(readlink -m $@)' _ {} \;

Or manually

    ln -s ~/.home/.bashrc_functions ~/.home/.bashrc_functions
    ln -s ~/.home/.bashrc_aliases ~/.home/.bashrc_aliases
    ln -s ~/.home/.config ~/.home/.config
    ln -s ~/.home/.my.cnf ~/.home/.my.cnf
    ln -s ~/.home/.grcat ~/.home/.grcat
    ln -s ~/.home/.bashrc_custom ~/.home/.bashrc_custom
    ln -s ~/.home/.gitconfig ~/.home/.gitconfig
    ln -s ~/.home/.git-prompt ~/.home/.git-prompt
    ln -s ~/.home/.git-completion ~/.home/.git-completion
    ln -s ~/.home/.pythonstartup ~/.home/.pythonstartup
    ln -s ~/.home/.vimrc ~/.home/.vimrc
    ln -s ~/.home/.django-completion ~/.home/.django-completion
    ln -s ~/.home/.grc ~/.home/.grc
    ln -s ~/.home/bin ~/.home/bin
    ln -s ~/.home/.vim ~/.home/.vim
    ln -s ~/.home/grc.conf ~/.home/grc.conf
    ln -s ~/.home/sublime-text-2 ~/.home/sublime-text-2
    ln -s ~/.home/.gitignore ~/.home/.gitignore
    ln -s ~/.home/.screenrc ~/.home/.screenrc
    ln -s ~/.home/.tmux.conf ~/.home/.tmux.conf

Put this line in the end of `~/.bash_profile`

    [ -f ~/.bashrc_custom ] && source ~/.bashrc_custom

Read it

    . ~/.bash_profile
