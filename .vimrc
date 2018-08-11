" Brain90 .vimrc
" Give me six hours to chop down a tree and 
" I will spend the first four sharpening the axe.

" --- BASIC EDITOR ---
set rtp+=~/.vim
set autoread
noremap <space> :
set nu                                     " line number
set ls=2                                   " always show file name on status bar
set nohlsearch
"set cursorline
"au VimEnter *  NERDTree

" standard convenient ide

tnoremap <Esc> <C-\><C-n>       " neovim terminal escape
inoremap <C-s> <esc>:update<cr> " save files
inoremap <C-q> <esc>:q!<cr>     " quit per tab discarding changes
inoremap <C-z> <esc>:qa!<cr>    " quit vim discarding changes
nnoremap <C-s> :w<cr>
inoremap <C-s> :w<cr>
nnoremap <C-q> :q!<cr>
nnoremap <C-z> :qa!<cr>
nnoremap <silent> <F8> :TlistToggle<CR>

" window management

nnoremap <C-e> :NERDTreeToggle<cr>                       " project folder
nnoremap <C-S-tab> :tabprevious<cr>                      " move to previous tab
nnoremap <C-tab>   :tabnext<cr>                          " move to next tab
nnoremap <C-t>     :tabnew<cr>
"nnoremap <C-t>     :tabnew<cr>:NERDTree<cr>:wincmd p<cr> " create new tab, autoOpen explorer

inoremap <C-S-tab> <esc>:tabprevious<cr>i                                     
inoremap <C-tab>   <esc>:tabnext<cr>i                                     
inoremap <C-t>     <esc>:tabnew<cr>         
nnoremap <C-h> <C-w>h                           " easy windows navigation         
nnoremap <C-j> <C-w>j                          
nnoremap <C-k> <C-w>k                          
nnoremap <C-l> <C-w>l                          


"highlight ColorColumn ctermbg=magenta      " 80 column border
"call matchadd('ColorColumn', '\%81v', 100)
"autocmd VimEnter *  NERDTree
filetype on
filetype indent on
set backspace=indent,eol,start
set showmatch                              " set show matching parenthesis
set nocp
set history=1000                           " remember more commands and search history
set undolevels=1000                        " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                  " change the terminal's title
set hidden
set nobackup                               " drop nasty swaps    
set noswapfile                                   
set showmode                                    
set gdefault                               " auto global flag in search/replace
set ignorecase                             " case insensitive search
set autoread                               " auto reload changes outside vim
let mapleader=","
let maplocalleader="\\"
"set clipboard=unnamed

" tabbing                                   
set tabstop=2                              " The width of a TAB is set to 4.                                   
set shiftwidth=2                           " Indents will have a width of 4                                   
set softtabstop=2                          " Sets the number of columns for a TAB
set expandtab                              " Expand TABs to spaces                                   
filetype plugin indent on   

"--- MACRO ---"

" PostgresEditView
let @v=':2d/SELECT:1yyp:1idrop :2icreate :1vj:s/"//:1vj:s/$/;/:2:s/;/ AS/g'

" Powerfull array maker
let @q="^i'$a',"
vnoremap <leader>q :'<,'> norm! @q<CR>


"--- PLUGIN CONFIG ---"

" make ctrl + p run faster
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden                                   
      \ --ignore .git                                   
      \ -g ""'                                   

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" grep/Ack/Ag for the word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" SPLIT SEPARATOR                                   
set encoding=utf8                                   
set fillchars=vert:\│                                   

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Increment visual select
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Tlist CTags Object browser
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_Enable_Fold_Column = 0

set nocompatible              " be iMproved, required
filetype off                  " required

" -- VUNDLE PACKAGE MANAGER --

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'dkprice/vim-easygrep'
Plugin 'vitalk/vim-simple-todo'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'aquach/vim-mediawiki-editor'
"Plugin 'krisajenkins/vim-pipe'
Plugin 'krisajenkins/vim-postgresql-syntax'
Plugin 'martingms/vipsql'


"Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/MatchTagAlways'
"Plugin 'maksimr/vim-jsbeautify'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let tlist_php_settings='php;f:function' 
"let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.
highlight Folded ctermbg=none
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php"

"function! ClipboardYank()
"  call system('xclip -i -selection clipboard', @@)
"endfunction
"function! ClipboardPaste()
"  let @@ = system('xclip -o -selection clipboard')
"endfunction
"
"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>p

"nnoremap <F9> :!python %<cr>
"inoremap <F9> :!python %<cr>
"inoremap <F12> sys.exit()

let g:ftplugin_sql_omni_key = '<C-j>'
colorscheme monokain

"Github autosync after .vimrc modified
autocmd BufWritePost * if @% == '.vimrc' | execute '!git commit % -m improvement; git push origin master' | endif
