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
Plugin 'Yggdroot/indentLine'
Plugin 'Ron89/thesaurus_query.vim'
Plugin 'reedes/vim-wordy'
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-quote'
Plugin 'vim-scripts/ScrollColors'

Plugin 'valloric/youcompleteme'

Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'

call vundle#end()
" } end plugins

filetype plugin indent on " required after vundle
cabbrev Goyo Goyo 85%x85%-2%
cabbrev shiba !shiba --detach %

let mapleader=","

" default styling {
" set cursorline
set antialias
set tw=0              " textwidth doesn't wrap
set relativenumber    " page numbering
set number
set nowrap            " lines continue across RHS window
set tabstop=4
set shiftwidth=4
set smarttab
set smartcase
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
winpos 720 0

"adds extra key mappings for save, quit, and colon
nnoremap ; :
command WQ wq
command Wq wq
command Q q
command W w
" } end default styling

"Youcompleteme fix {
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" } end YCM

" file types {
augroup word_processors
  autocmd!
  autocmd BufNewFile,BufRead *.html call HTMLSettings()
augroup END
" } end file types

" word processor {

" `:call WP()`		opens the word processor mode
" `z=`				displays corrections
" `zg`				adds words to dictionary

" the `true` word processor is the best way to strip away menus, toolbars, and styling. Just let the words flow.
function! WP()
  setlocal noexpandtab        "When the tab key is pressed, inserts a tab and not several spaces
  setlocal formatoptions=1
  map j gj
  map k gk
  setlocal formatprg=par
  setlocal wrap
  setlocal linebreak
  setlocal spellfile=~/.vim/spell/en.utf-8.add
  setlocal spell spelllang=en_au
  setlocal spell syntax=off
  setlocal complete+=s
  retab

  UniCycleOn
  Goyo 85%x85%-2%

  colorscheme Benokai
  setlocal lines=42 columns=85
endfunction

" The lazy word processor is the preferred choice for casual editing, or text files with a lot of code examples
function! LazyWP()
  setlocal noexpandtab
  setlocal formatoptions=1
  map j gj
  map k gk
  setlocal formatprg=par
  setlocal wrap
  setlocal linebreak    " line wraps don't break up words

  UniCycleOff 		" Unicycle can mess up some coding, so it is disabled for the lazy mode

  colorscheme materialtheme
  setlocal lines=42 columns=85
endfunction
" } end word processors

" html settings {
let g:user_emmet_install_global = 0

function! HTMLSettings() 
	EmmetInstall
	set lines=50 columns=92
	setlocal tabstop=2
	bufdo colorscheme Tomorrow-Night-Eighties
	setlocal foldmethod=syntax
	bufdo syntax spell toplevel
	bufdo syn case ignore
	bufdo syn match htmlError "[<>&]"
endfunction

" } end html settings

" unicycle {
" best to use only for certain filetypes
" utf-8 MUST BE ON
" -- is en dash; --- is em dash; ---- is back to hyphen-minus
"  ... is ellipsis
"  double and single quotes are automatically done
" :UniCycleOn
" http://www.vim.org/scripts/script.php?script_id=1384
" } end unicycle

" java coding standards - move this to an ftplugin {
" these are simply all the standards that my institution uses for Java - at least, the ones I can fix with a setting
augroup java_standards
  autocmd!
  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
augroup END
" } end java coding standards

" folds {
set foldmethod=marker
set foldmarker={,}
set foldlevel=2
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
" } end folds
" } end vimrc
