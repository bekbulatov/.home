set nocompatible " use Vim settings, rather then Vi settings (much better!)

" Vundle settings
" ---------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "fholgado/minibufexpl.vim"
Bundle "scrooloose/nerdtree"
" Bundle 'kien/ctrlp.vim.git'
" Bundle 'vim-scripts/bufexplorer.zip'

Bundle "davidhalter/jedi-vim"
Bundle "nvie/vim-flake8"

" Bundle "vim-colorschemes"

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
set wildmenu " turn on wildmenu
set wcm=<Tab> " wildmenu navigation key
set laststatus=2 " status line is always visible
set winminheight=0 " minimum window height (FIXME)
set scrolloff=3 " lines count around cursos
set background=dark " we want dark and scary interface
set hidden " make Vim more liberal about hidden buffer

set paste
set ignorecase
set smartcase

set wrap "Переносим на другую строчку
set linebreak "Разрываем строки

" tabulation settings
" -------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set autoindent

autocmd FileType python setlocal expandtab " convert tabs to spaces




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
" set listchars=tab:>>,eol:$,trail:.
set listchars=tab:▸\ ,eol:¬

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



" NERDTree settings
" -----------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1 " NerdTree minimal interface (???)
let NERDTreeIgnore = ['\.pyc$', '\.pyo$'] " Ignore files on NERDTree
map <leader>f :NERDTreeToggle<CR> " toggle by \f


" flake8 settings
" ---------------
" autocmd BufWritePost *.py call Flake8()


" MiniBufExpl
" -----------
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


" Color sheme
" -----------
syntax on
colorscheme desert256 "Цветовая схема
set t_Co=256




"Перед сохранением вырезаем пробелы на концах
autocmd BufWritePre * :%s/\s\+$//e
"В .py файлах включаем умные отступы после ключевых слов
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

""""Дальше мои личные настройки,
""""в принципе довольно обычные, может кому надо

" set mousehide "Спрятать курсор мыши когда набираем текст
" set mouse=a "Включить поддержку мыши
" set termencoding=utf-8 "Кодировка терминала
" set novisualbell "Не мигать
" set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
" set backspace=indent,eol,start whichwrap+=<,>,[,] "Удобное поведение backspace
" set showtabline=0 "Вырубаем черточки на табах
" set foldcolumn=1 "Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"

nmap \ll :set list!<CR>  " Shortcut to rapidly toggle `set list`
nmap \l :setlocal number!<CR> " turn on/off numbers
nmap \o :set paste!<CR> " Ctrl-V
nmap \q :nohlsearch<CR>


" Edit commands http://vimcasts.org/episodes/the-edit-command/
" ------------------------------------------------------------
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

map <leader>ew :e <C-R>=expand("%:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:h") . "/" <CR>


" Restore cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif


" nmap <C-e> :e#<CR>
