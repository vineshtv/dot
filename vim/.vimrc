"Not compatible with vi. who is?
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
Plugin 'hashivim/vim-terraform'

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
syntax on

" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
" For some examples.

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack




" Sane pasting
command! Paste call SmartPaste()
" {{{ Sane Pasting

function! SmartPaste()
    setl paste
    normal "+p
    setl nopaste
endfunction

" }}}

" Insert timestamp
nnoremap ,tz "=strftime("%FT%T%z")<CR>P
nnoremap ,ts "=strftime("%Y-%m-%d %H:%M:%S")<CR>P



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

" Turn on relative numbering
set relativenumber

"This shows what you are typing as a command.
set showcmd

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

colorscheme zenburn

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
"let g:airline_theme='cobalt2'
let g:airline_theme='badwolf'
"let g:airline_theme='qwq'


" Syntax checking 
Plugin 'vim-syntastic/syntastic'
" PEP8
Plugin 'nvie/vim-flake8'


let python_highlight_all=1
syntax on

"Configs for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'

command St SyntasticToggleMode

"Syntastic is becoming too slow for me when using pandas. Not really sure
"why. So for now I will keep it toggled off and whenever needed
"use ctrl-w E to perform a check
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>


let g:syntastic_quiet_messages = {
    \ "regex":   '\missing-docstring\|import-error'}
    "'missing-docstring'}

"let g:syntastic_python_checker_args='--ignore=C0'
"let g:syntastic_python_pylint_args='--ignore=C0111'
"let g:syntastic_python_flake8_args='--ignore=C0111'
"let g:syntastic_python_pep8_args='--ignore=C0111'
"let g:syntastic_python_pycodestyle_args='--ignore=C0111'
"let g:syntastic_python_pyflakes_args='--ignore=C0111'
" Auto Complete plugin
"Bundle 'Valloric/YouCompleteMe'

colorscheme zenburn

"autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json fdm=syntax
autocmd BufNewFile,BufRead */jsonschema/* set ft=json fdm=syntax
autocmd BufNewFile,BufRead *.py set ft=python fdm=indent foldlevel=100
autocmd BufNewFile,BufRead *.ts set ft=javascript fdm=syntax
set clipboard=unnamed

map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

nnoremap <silent><expr> <c-w>] ':<c-u>'.(winwidth(0) > 79 ? 'vert' : '').' wincmd ]<cr>'
nnoremap ,c 0f(3wyt)o<ESC>pV:s/\([a-z_]\+\),\?/self.\1 = \1<C-v><CR>/g<CR>ddV?def<CR>j

nnoremap ,greqs :-1read $HOME/.vim/.requests_get<CR>

" Terraform plugin https://github.com/hashivim/vim-terraform
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
"Allow vim-terraform to automatically fold (hide until unfolded) sections of
"terraform code. Defaults to 0 which is off.
let g:terraform_fold_sections=1
"Allow vim-terraform to automatically format *.tf and *.tfvars files with
"terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
