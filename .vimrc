set nocompatible " use Vim settings, rather then Vi settings (much better!)

" Vundle settings
" ---------------
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Interface
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'jlanzarotta/bufexplorer'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-fugitive'

" Python
	Plugin 'python.vim'
	Plugin 'django.vim'
	Plugin 'nvie/vim-flake8'

" Ruby
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'ngmy/vim-rubocop'
	Plugin 'tpope/vim-cucumber'

" Go
	Plugin 'fatih/vim-go'

" HTML
	Plugin 'othree/html5.vim'

" Markdown
	Plugin 'plasticboy/vim-markdown'

" Puppet
	Plugin 'rodjek/vim-puppet'

" Terraform
	Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype plugin indent on

" Some simple stuff
" -----------------
set showcmd                              " display incomplete commands
set incsearch                            " do incremental searching
set hlsearch                             " highlight searching results
set number                               " show line numbers
set wrap                                 " turn on line wrap
set linebreak                            " wrap long lines
set gdefault                             " always global regex
set nobackup                             " do not create backup files
set noswapfile                           " do not create swap files
set nofoldenable                         " turn off folding
set wildmode=list:longest,full           " zsh-like autocomplete
set wildmenu                             " turn on wildmenu
set wcm=<Tab>                            " wildmenu navigation key
set laststatus=2                         " status line is always visible
set winminheight=0                       " minimum window height
set scrolloff=3                          " lines count around cursos
set background=dark                      " we want dark and scary interface
set hidden                               " this allows to edit several files in the same time without having to save them
set ignorecase                           " case insensitive search
set smartcase                            " but sometimes it is case sensitive
set cursorline                           " hightlight the screen line of the cursor
set splitbelow                           " the new window will appear below the current one :sp
set splitright                           " the new window will appear right of the current one :vsp
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set encoding=utf-8                       " set internal encoding
set fileencodings=utf8,cp1251            " set file encodings
set wildignore+=.git,*.o,*.pyc,.DS_Store " set global list of ignores files
set fillchars=vert:\ ,fold:-             " chars for fill statuslines and vertical separators
set listchars=tab:▸\ ,eol:¬              " chars for showing inwisible symbols

" tabulation settings
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent

" remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Browsing
" -----------------
set isfname+=-
set path=.,,,
set path+=$PATH_BACK/**
set path+=$PATH_FRONT/**

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1 " NerdTree minimal interface (???)
let NERDTreeIgnore = ['\.pyc$', '\.pyo$'] " Ignore files on NERDTree
map <leader>f :NERDTreeToggle<CR> " toggle by \f

" Interface
" ---------------

syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" MiniBufExpl
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>q :bd<CR>

" Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

" restore cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Python
" ---------------

autocmd FileType python setlocal expandtab " convert tabs to spaces
autocmd FileType python setlocal colorcolumn=79
autocmd FileType python :iabbrev <buffer> pdb import pdb; pdb.set_trace()
autocmd FileType python :iabbrev <buffer> iab utf! # -*- coding: utf-8 -*-
autocmd BufRead,BufNewFile *.html if search('{{') > 0  || search('{%') > 0 | set filetype=htmldjango | endif
autocmd BufRead,BufNewFile *.xml if search('{{') > 0  || search('{%') > 0 | set filetype=htmldjango | endif

" Ruby
" ---------------

autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cucumber setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby map <buffer> <F7> :RuboCop<CR>
let g:vimrubocop_keymap = 0

" YAML
" ---------------

autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" JSON
" ---------------

autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" Hotkeys
" ---------------

" autocomplete with <Tab> key
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<CR>

nmap <leader>ll :set list!<CR>       " shortcut to rapidly toggle `set list`
nmap <leader>l :setlocal number!<CR> " turn on/off numbers
nmap <leader>o :set paste!<CR>       " ctrl-v
nmap <leader>h :nohlsearch<CR>       " turn off hightlighted results

" edit commands http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:h") . "/" <CR>

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" function! FileSize()
"    let bytes = getfsize(expand("%:p"))
"    if bytes <= 0
" 	   return ""
"    endif
"    if bytes < 1024
" 	   return bytes . "B"
"    else
" 	   return (bytes / 1024) . "K"
"    endif
" endfunction
"
" function! CurDir()
"    return expand('%:p:~')
" endfunction
