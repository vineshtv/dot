set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"Syntax highlighting
"set t_Co=256
"syntax on

"Auto indent
set autoindent

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"Display the cursor position
"set ruler

"enable use of the mouse for all modes
set mouse=a

"display line numbers
set number

"This shows what you are typing as a command.
"set showcmd

"syntax  highlighting
filetype on
filetype plugin on
syntax enable

"Spaces are always better than tabs
set expandtab
set smarttab

"and ofcourse 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"incremental search
set incsearch

"Always highlight search results. Not useful if you are color blind
set hlsearch

"showmatching brackets
set showmatch

"Turn backup off. And how annoying is the .swp file
set nobackup
set nowb
set noswapfile

"Checking out a new colorscheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif


"File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"Git Integration 
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

set t_Co=256
"let g:Powerline_symbols = "fancy"

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
"let g:airline_theme='solarized'
"let g:airline_theme='papercolor'
let g:airline_theme='cobalt2'
"let g:airline_theme='qwq'


" Syntax checking 
Plugin 'vim-syntastic/syntastic'
" PEP8
"Plugin 'nvie/vim-flake8'


let python_highlight_all=1
syntax on

"Configs for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = {
    \ "regex":   'missing-docstring' }

"let g:syntastic_python_checker_args='--ignore=C0'
let g:syntastic_python_pylint_args='--ignore=C0111'
"let g:syntastic_python_flake8_args='--ignore=C0111'
"let g:syntastic_python_pep8_args='--ignore=C0111'
"let g:syntastic_python_pycodestyle_args='--ignore=C0111'
"let g:syntastic_python_pyflakes_args='--ignore=C0111'
" Auto Complete plugin
"Bundle 'Valloric/YouCompleteMe'

