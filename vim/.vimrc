set vb
set tags=/vobs/fw/tags
set bg=dark
set tagstack
set autowrite
ab #d #define
ab #i #include
ab #b /************************************************
ab #e ************************************************/
ab #l /*----------------------------------------------*/
set ts=8
set sw=4
set softtabstop=4
set expandtab
set autoindent
set noai
"set pastetoggle=<F11>
set number
set ic
set backspace=2
set autoindent
set scrolljump=5
set scrolloff=3

"Always show the current position
set ruler

" Show matching brackets
set showmatch

colorscheme desert
set nopaste

" Set to autoread when a file is changed from the outside
set autoread

" Dont redraw when running macros. Good for performance
set lazyredraw

" for regular expressions turn magic on. Who doesnt like magic
set magic

" Turn backup off. No more annoying swap files.
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful!
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"changing split window size with hot keys.
nnoremap <C-LEFT> :vertical resize -5<cr>
nnoremap <C-UP> :resize +5<cr>
nnoremap <C-DOWN>   :resize -5<cr>
nnoremap <C-RIGHT> :vertical resize +5<cr>

"shift + insert for gui
if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

map <S-insert> <MiddleMouse>
map! <S-insert> <MiddleMouse>

set guifont=Monospace\ 12

"how the hell do I start gvim in fullscreen
"set lines=50 columns=100
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  " This Maximises the window to both the screens in a shared desktop so
  " commenting for now.
  " set lines=999 columns=999
endif

"was trying out a method to change font with hotkeys.. Does NOT work. Need to
"check
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
        let newfont = fontname . newsize
        let &guifont = newfont
    endif
else
    echoerr "You need to run the GTK2 version of Vim to use this function."
endif
endfunction
function! LargerFont()
call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()
"End of font change method
"The above method does not work. But still keeping it and hoping for some
"magic in future

"Folding based on syntax. Fold level 1.
set foldmethod=syntax
set foldlevelstart=1

"Bundle 'majutsushi/tagbar'

set t_Co=256

execute pathogen#infect()

"syntax enable
"set background=dark
"colorscheme solarized
