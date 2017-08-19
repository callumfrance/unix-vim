" {
set nocompatible          " required
filetype off              " required before vundle

"plugins and vundle {

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'
"vundle plugins go here
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
" Plugin 'Yggdroot/indentLine'
Plugin 'Ron89/thesaurus_query.vim'
" Plugin 'reedes/vim-wordy'
" Plugin 'kana/vim-textobj-user'
" Plugin 'reedes/vim-textobj-quote'
Plugin 'vim-scripts/ScrollColors'

" Plugin 'valloric/youcompleteme'

Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'

" The below are for ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

call vundle#end()
" }

filetype plugin indent on " required after vundle
cabbrev Goyo Goyo 95%x95%-2%
cabbrev shiba !shiba --detach %

set list listchars=tab:\|\ ,trail:·

" { Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" where to look for word completions
    "buffer, windows, other buffers, unloaded buffers, tags, includes/imports
    "kspell looks in dictionary when using spelling  
set complete=.,w,b,u,t,i
" the following change the key mappings of omni complete
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"

" this function maps <Tab> to either insert a <Tab> if the current line is
    " only whitespace, or start/continue a CTRL-N completeion operation
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
" }

let mapleader=","

" default styling {
" set cursorline
set antialias
set relativenumber    " page numbering
set number
set nowrap            " lines continue across RHS window
set tabstop=4
set shiftwidth=4
set smarttab
set smartcase
set smartindent		" autoindenting when starting a new line
set autoindent
set shiftround
set noexpandtab

set ignorecase        " search functionality
set showmatch
set hlsearch

set history=100       " mistakes
set undolevels=100
set noerrorbells

set title
set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8

set nowritebackup
set noswapfile
set nobackup

colorscheme solarized
set background=dark
set lines=40 columns=75
" }

" File explorer {
 let g:netrw_winsize=40
" let g:netrw_altv = 1 " open from the right
" let g:netrw_browse_split=4 " opens in previous tab
 let g:netrw_banner=0 " removes the useless banner up the top
" Use :Vexplore to open a file explorer in vertical mode
" }

" mappings {
nnoremap ; :
nnoremap <space> :w<CR>:nohl<CR>
command WQ wq
command Wq wq
command W w
command Q q
" maps the F3 key to file viewer
nnoremap <F3> :Explore<CR> 
" maps normal-mode <tab> key to switching windows
nnoremap <tab> <C-W>w
" normal-mode backspace to switch into other direction
nnoremap <bs> <C-W>W
" }

" file types {
augroup word_processors
  autocmd!
  autocmd BufNewFile,BufRead *.html call HTMLSettings()
augroup END
" }

" word processor {

" `:call WP()`		opens the word processor mode
" `z=`				displays corrections
" `zg`				adds words to dictionary
function! WP()
  setlocal noexpandtab        "When the tab key is pressed, inserts a tab and not several spaces
  map j gj
  map k gk
  setlocal formatoptions=an1
		"a = automatic formatting of paragraphs
		"n = recognize numbered lists
		"1 = don't break line after a one-letter word
  setlocal spellfile=~/.vim/spell/en.utf-8.add
  setlocal spell spelllang=en_au
  setlocal syntax=on
  setlocal complete+=s
  retab

  set guifont=Monaco:h12

  set wrap linebreak nolist

  " UniCycleOn
  Goyo 99%x99%

  colorscheme Benokai
  setlocal lines=42 columns=80
  setlocal tw=80
endfunction

function! LazyWP()
  setlocal noexpandtab
  setlocal formatoptions=1
  map j gj
  map k gk
  setlocal formatprg=par
  setlocal wrap
  setlocal linebreak    " line wraps don't break up words

  " UniCycleOn

  colorscheme materialtheme
  setlocal lines=41 columns=65
endfunction
" }

" html settings {
let g:user_emmet_install_global = 0

function! HTMLSettings() 
	EmmetInstall
	set lines=45 columns=82
	setlocal tabstop=2
	bufdo colorscheme Tomorrow-Night-Eighties
	setlocal foldmethod=syntax
	bufdo syntax spell toplevel
	bufdo syn case ignore
	bufdo syn match htmlError "[<>&]"
endfunction

" }

" unicycle {
" best to use only for certain filetypes
" utf-8 MUST BE ON
" -- is en dash; --- is em dash; ---- is back to hyphen-minus
"  ... is ellipsis
"  double and single quotes are automatically done
" :UniCycleOn
" http://www.vim.org/scripts/script.php?script_id=1384
" }

" java coding standards - move this to an ftplugin {
augroup java_standards
  autocmd!
  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
augroup END
" }

" folds {
set foldmethod=marker
set foldmarker={,}
set foldlevel=1

set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
" }
" }

