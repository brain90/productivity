" NVIM v0.6.1
" Brain90 .vimrc
" Give me six hours to chop down a tree and 
" I will spend the first four sharpening the axe.

" BASIC EDITOR

" jump to command mode in only one keystroke
noremap <space> :

set rtp+=~/.vim
set autoread
set splitright
set nu       
set ls=2 " always show file name on status bar
set nohlsearch
set wildmenu
let mapleader=","
nnoremap <leader>t :Tabularize /:<CR>
nnoremap <leader>f gg=G<CR>

" STANDARD CONVENIENT IDE
inoremap <C-s> <esc>:update<cr> " save files
inoremap <C-q> <esc>:q!<cr>     " quit per tab discarding changes
inoremap <C-z> <esc>:qa!<cr>    " quit vim discarding changes
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
nnoremap <C-q> :q!<cr>
nnoremap <silent> <F8> :TlistToggle<cr>
inoremap <C-a> <esc>:%y<cr>
nnoremap <C-a> :%y<cr>

" find & replace
vnoremap <leader>v :s/\%V
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" WINDOW MANAGEMENT
nnoremap <C-h> <C-w><C-h>            " easy windows navigation
nnoremap <C-l> <C-w><C-l>                         
nnoremap <C-e> :NERDTreeToggle<cr>   " project folder
nnoremap <C-t> :tabnew<cr>
inoremap <C-t> <esc>:tabnew<cr>         

" ONLY WORKS IN GVIM 
"nnoremap <C-S-tab> :tabprevious<cr>  " move to previous tab
"nnoremap <C-tab>   :tabnext<cr>      " move to next tab
"inoremap <C-S-tab> <esc>:tabprevious<cr>i                                     
"inoremap <C-tab>   <esc>:tabnext<cr>i                                     

" CTRL-Tab is next tab
"noremap <C-Tab> :<C-U>tabnext<CR>
"inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
"cnoremap <C-Tab> <C-C>:tabnext<CR>
"" " CTRL-SHIFT-Tab is previous tab
"noremap <C-S-Tab> :<C-U>tabprevious<CR>
"inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
"cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" COMMON
silent! tnoremap <Esc> <C-\><C-n>
set clipboard=unnamedplus

au FileType sql set equalprg=pg_format     " postgres sql formatter. call it with ,f
set backspace=indent,eol,start
set showmatch                              " set show matching parenthesis
set nocp
set history=1000                           " remember more commands and search history
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set undolevels=1000                        " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                  " change the terminal's title
set hidden
set noswapfile                                   
set showmode                                    
set gdefault                               " auto global flag in search/replace
set ignorecase                             " case insensitive search
set autoread                               " auto reload changes outside vim
let maplocalleader="\\"

" TAB SETTINGS                                  
set tabstop=4                              " The width of a TAB is set to 4.                                   
set shiftwidth=4                           " Indents will have a width of 4                                   
set softtabstop=4                          " Sets the number of columns for a TAB
set expandtab                              " Expand TABs to spaces                                   
filetype plugin indent on   

" MACRO "

" PostgresEditView
"let @v='vggyypgg3cwdrop$a�kb�kb;Ga;'
"let @v='ggyypgg3cwdrop^[$a^[k$;^[Ga;^['

" PostgresEditView
let @v = ':2d^M/SELECT^M:1 yyp^M:1 idrop ^[:2 icreate ^[:1 vj:s/"//^M:1 vj:s/$/;/^M:2 :s/;/ AS/g^M'
let @q="0i'<Esc>A'<Esc>j"

"let @v=':2d/SELECT :1 yyp:1 idrop ␛:2 icreate ␛:1 vj:s/"// :1 vj:s/$/;/ :2 :s/;/ AS/g' 

" Wilblokno
let @w="0iwhere wil='␃␃f.i' and no='�kD␃␃lf.i' and blok='�kD␃␃$a';␃0i"

" Powerfull array maker
let @q="^i'␛$a',␛j"
vnoremap <leader>q :'<,'> norm! @q<CR>

" pre code
let @p="{i<pre>␃␃}o</pre>␃␃"

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
  let g:ctrlp_use_caching = 1
endif

" grep/Ack/Ag for the word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" split separator                                   
set encoding=utf8                                   
set fillchars=vert:\│                                   

" edit the vimrc file
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
filetype off                  " required

" PLUGIN MANAGER ------------------------ {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-dadbod'
Plugin 'kristijanhusak/vim-dadbod-ui'
Plugin 'kristijanhusak/vim-dadbod-completion'
Plugin 'Shougo/deoplete.nvim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'edsono/vim-matchit'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'vitalk/vim-simple-todo'
Plugin 'flazz/vim-colorschemes'
"Plugin 'krisajenkins/vim-postgresql-syntax'
"Plugin 'chikamichi/mediawiki.vim'
Plugin 'rking/ag.vim'
Plugin 'mrpeterlee/VimWordpress'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
"Plugin 'swekaj/php-foldexpr.vim'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-auto-save'
Plugin 'zah/nim.vim'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'beanworks/vim-phpfmt'
"Plugin 'stephpy/vim-php-cs-fixer'
"Plugin 'autozimu/LanguageClient-neovim'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'sjl/gundo.vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'dkprice/vim-easygrep'
"Plugin 'mattn/emmet-vim'
"Plugin 'aquach/vim-mediawiki-editor'
"Plugin 'sk1418/HowMuch'
"Plugin 'enricobacis/vim-airline-clock'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'martingms/vipsql'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/MatchTagAlways'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'krisajenkins/vim-pipe'
"Plugin 'lifepillar/pgsql.vim'
call vundle#end()
" }}}

" load scheme from vundle
syntax on
colorscheme monokain
nnoremap <leader>a :Ag 

" PROGRAMMING LANGUAGE 
" let tlist_php_settings='php;f:function' 
"let php_folding = 0        "Set PHP folding of classes and functions.
"let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
"let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
"let php_noShortTags = 0    "Disable PHP short tags.
"highlight Folded ctermbg=none
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php"
"autocmd BufWritePost *.php execute 'silent !prettier --print-width 100 % --write' | execute 'redraw!'

" SESSION

" save session
nnoremap <leader>s :mksession<CR>

" BACKUP
set backup
set backupdir=~/.vim/backups
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set modelines=1

" Searching
set incsearch           " search as characters are entered

nnoremap <F5> :!cat in \| python %<cr>
"inoremap <F9> :!python %<cr>
inoremap <F12> sys.exit()

"let g:ftplugin_sql_omni_key = '<C-j>'

""autosync after .vimrc modified
"autocmd BufWritePost * if @% =~ '.vimrc' | execute '!cd /home/brain/Documents/Projects/productivity; git commit .vimrc -m improvement; git push origin master' | endif
" vim:foldmethod=marker:foldlevel=0


" arrow keys resize windows
"nnoremap <Left> :vertical resize +10<CR>
"nnoremap <Right> :vertical resize -10<CR>
"nnoremap <Up> :resize +10<CR>
"nnoremap <Down> :resize -10<CR>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>
"
" Disable anoying ex mode
nnoremap Q <Nop>

" doesn't display the mode status
set noshowmode
set shortmess=a

"au BufNewFile,BufRead *.py set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" let php_folding = 1        "Set PHP folding of classes and functions.
" let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
" let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
" let php_noShortTags = 1    "Disable PHP short tags.


"let phpfold_use              = 1 "Fold groups of use statements in the global scope.
"let phpfold_group_iftry      = 1 "Fold if/elseif/else and try/catch/finally blocks as a group, rather than each part separate.
"let phpfold_group_args       = 1 "Group function arguments split across multiple lines into their own fold.
"let phpfold_group_case       = 1 "Fold case and default blocks inside switches.
"let phpfold_heredocs         = 1 "Fold HEREDOCs and NOWDOCs.
"let phpfold_docblocks        = 1 "Fold DocBlocks.
"let phpfold_doc_with_funcs   = 1 "Fold DocBlocks. Overrides b:phpfold_docblocks.
"let phpfold_text             = 0 "Enable the custom foldtext option.
"let phpfold_text_right_lines = 1 "Display the line count on the right instead of the left.
"let phpfold_text_percent     = 1 "Display the percentage of lines the fold represents.

"auto save
"let g:auto_save = 1  " enable AutoSave on Vim startup

"freedom cursor movement set virtualedit=all %!fold -w 60

set shortmess=a


nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>


" comment
" Remap Ctrl + / to toggle comments
nnoremap <C-_> :call ToggleComment()<CR>
vnoremap <C-_> :<C-U>call ToggleCommentVisual()<CR>

function! ToggleComment()
  if getline('.') =~ '^\s*//'
    " Uncomment the line
    s#^\(\s*\)// #\1#
  else
    " Comment the line
    s#^\(\s*\)#\1// #
  endif
endfunction

function! ToggleCommentVisual()
  '<,'>s#^\(\s*\)\(// \)\?#\1// #
endfunction

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:db_ui_auto_execute_table_helpers = 0

let g:db = 'postgresql://bsm:bsm!@localhost:5432/bsm'
set completeopt-=preview

