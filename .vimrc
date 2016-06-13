set nocompatible              " be iMproved, required
filetype off                  " required

" Set bash as the shell
set shell=/bin/bash
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ### axdg's plugins;
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-buftabline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kristijanhusak/vim-hybrid-material'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ### axdg's settings
let mapleader = '\'

set guifont=Roboto\ Mono:h16
syntax enable
set number
set background=dark
colorscheme hybrid_material

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
