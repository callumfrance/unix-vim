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
Plugin 'junegunn/limelight.vim'

call vundle#end()
" }

filetype plugin indent on " required after vundle
cabbrev Goyo Goyo 85%x85%-2%
cabbrev shiba !shiba --detach %

let mapleader=","

" default styling {
" set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set relativenumber
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
colorscheme solarized
set background=dark
winpos 720 0

"adds extra key mappings for save, quit, and colon
nnoremap ; :
command WQ wq
command Wq wq
command Q q
command W w
" }

" folds {
set foldmethod=marker
set foldmarker={,}
set foldlevel=1
" }

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" word processor {
function! WP()
  colorscheme Benokai
  setlocal lines=42 columns=85
  setlocal expandtab
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

  Goyo 85%x85%-2%
endfunction

function LazyWP()
  colorscheme materialtheme
  setlocal lines=42 columns=85
  setlocal expandtab
  setlocal formatoptions=1
  map j gj
  map k gk
  setlocal formatprg=par
  setlocal wrap
  setlocal linebreak
endfunction

"augroup word_processors
"  autocmd!
"  autocmd BufNewFile,BufRead *.md,*.markdown call WP()
"  autocmd BufNewFile,BufRead *.txt call WP()
"  autocmd BufNewFile,BufRead *.textile,*.rst call WP()
"augroup end

" }

" java coding standards {
augroup java_standards
  autocmd!
  autocmd Filetype java set tabstop=4
  autocmd Filetype java set shiftwidth=4
augroup END
" }
" }
