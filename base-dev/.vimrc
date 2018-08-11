" *****************************************************************************
" .vimrc
"
" Format:
"   Setup Vundle for plugin management
"   Base-dev plugins
"   Base-dev config
"   Include language specific vimrc's
"   Vundle finish up
"
" *****************************************************************************

" *****************************************************************************
" Vundle setup
" *****************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" *****************************************************************************
" Base-dev plugins
" *****************************************************************************
" colourschemes
Plugin 'sonjapeterson/1989.vim'
Plugin 'sickill/vim-monokai'

" packages
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'

" *****************************************************************************
" Base-dev config
" *****************************************************************************
" Load plugins that give us settings now so we can override them if needed.
runtime! plugin/sensible.vim

" And the haters' gonna hate, hate, hate, hate, hate... this Taylor Swift color scheme
colorscheme 1989
"colorscheme monokai

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Hybrid line numbers
set number relativenumber

"number of lines either side of cursor
set scrolloff=4

" Indentation
set tabstop=4
set shiftwidth=2
set expandtab
filetype plugin indent on
syntax on

" line ruler
"set colorcolumn=120
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" Spellcheck
setlocal spell spelllang=en_gb

" **************
" Iron-man mode
" **************
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
"set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)

" *****************************************************************************
" Language specific includes
" **********************ADD-LANGUAGE-SPECIFIC-CONFIG-HERE**********************

" *****************************************************************************
" Vundle finish up
" *****************************************************************************
" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

