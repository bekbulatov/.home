set nocompatible " use Vim settings, rather then Vi settings (much better!)

" Vundle settings
" ---------------
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/gundo.vim'

Plugin 'scrooloose/syntastic'

" Interface
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'

	Plugin 'altercation/vim-colors-solarized'
	Plugin 'tpope/vim-fugitive'

" Python
	Plugin 'django.vim'
	Plugin 'nvie/vim-flake8'
	Plugin 'python.vim'

" Ruby
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'ngmy/vim-rubocop'

" Go
	Plugin 'fatih/vim-go'

" HTML
	Plugin 'othree/html5.vim'

" Markdown
	Plugin 'plasticboy/vim-markdown'

" Puppet
	Plugin 'rodjek/vim-puppet'


call vundle#end()
filetype plugin indent on

" Some simple stuff
" -----------------
set showcmd " display incomplete commands
set incsearch " do incremental searching
set hlsearch " highlight searching results
set number " show line numbers
set wrap " turn on line wrap
set gdefault " always global regex
set nobackup " do not create backup files
set noswapfile " do not create swap files
set nofoldenable " turn off folding
set wildmode=list:longest,full   " Автодополнение на манер zsh
set wildmenu " turn on wildmenu
set wcm=<Tab> " wildmenu navigation key
set laststatus=2 " status line is always visible
set winminheight=0 " minimum window height (FIXME)
set scrolloff=3 " lines count around cursos
set background=dark " we want dark and scary interface
set hidden " this allows to edit several files in the same time without having to save them

" set paste
set ignorecase
set smartcase

set wrap "Переносим на другую строчку
set linebreak "Разрываем строки

set cursorline " Подсветка строки, в которой находится в данный момент курсор
set splitbelow " новый сплит будет ниже текущего :sp
set splitright " новый сплит будет правее текущего :vsp


" tabulation settings
" -------------------
set noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set smarttab
set autoindent

autocmd FileType python setlocal expandtab " convert tabs to spaces
autocmd BufRead,BufNewFile *.html if search('{{') > 0  || search('{%') > 0 | set filetype=htmldjango | endif
autocmd BufRead,BufNewFile *.xml if search('{{') > 0  || search('{%') > 0 | set filetype=htmldjango | endif

autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cucumber setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set file encodings
set encoding=utf-8
set fileencodings=utf8,cp1251

" set global list of ignores files
set wildignore+=.git,*.o,*.pyc,.DS_Store

" chars for fill statuslines and vertical separators
set fillchars=vert:\ ,fold:-

" chars for showing inwisible symbols
set listchars=tab:▸\ ,eol:¬

" set showmatch       " показываем открывающие и закрывающие скобки

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

" http://www.allaboutvim.ru/2012/03/blog-post.html
       set isfname+=-
       set path=.,,,
       set path+=$PATH_BACK/**
       set path+=$PATH_FRONT/**


" Приводим в порядок status line

       function! FileSize()
           let bytes = getfsize(expand("%:p"))
           if bytes <= 0
               return ""
           endif
           if bytes < 1024
               return bytes . "B"
           else
               return (bytes / 1024) . "K"
           endif
       endfunction

       function! CurDir()
           return expand('%:p:~')
       endfunction


" NERDTree settings
" -----------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1 " NerdTree minimal interface (???)
let NERDTreeIgnore = ['\.pyc$', '\.pyo$'] " Ignore files on NERDTree
map <leader>f :NERDTreeToggle<CR> " toggle by \f


" Gundo settings
" --------------
nnoremap <F5> :GundoToggle<CR>
" map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>


" flake8 settings
" ---------------
" autocmd BufWritePost *.py call Flake8()


" Rubocop settings
" ---------------
let g:vimrubocop_keymap = 0
map <buffer> <F7> :RuboCop<CR>


" MiniBufExpl
" -----------
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>q :bd<CR>


"Перед сохранением вырезаем пробелы на концах
autocmd BufWritePre * :%s/\s\+$//e

set mousehide "Спрятать курсор мыши когда набираем текст
" set mouse=a "Включить поддержку мыши
" set termencoding=utf-8 "Кодировка терминала
" set novisualbell "Не мигать
" set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
" set backspace=indent,eol,start whichwrap+=<,>,[,] "Удобное поведение backspace
" set showtabline=0 "Вырубаем черточки на табах
" set foldcolumn=1 "Колоночка, чтобы показывать плюсики для скрытия блоков кода:

nmap <leader>ll :set list!<CR>  " Shortcut to rapidly toggle `set list`
nmap <leader>l :setlocal number!<CR> " turn on/off numbers
nmap <leader>o :set paste!<CR> " Ctrl-V
nmap <leader>h :nohlsearch<CR>

" Edit commands http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:h") . "/" <CR>


" Restore cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif


" Цветовая схема
    syntax enable
    set t_Co=256
    set background=dark
    let g:solarized_termcolors=256
    colorscheme solarized


" Airline {{{
	let g:airline_theme='solarized'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#whitespace#checks = [ 'trailing' ]
	let g:airline#extensions#ctrlp#color_template = 'normal'
	let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" }}}

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

iab pdb import pdb; pdb.set_trace()
iab utf! # -*- coding: utf-8 -*-

" set colorcolumn=80
