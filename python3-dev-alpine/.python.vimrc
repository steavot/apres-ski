" Python specific settings for vim

" Because Python
set encoding=utf-8

" Python code folding - toggle with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1

" Python indentation
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
Plugin 'vim-scripts/indentpython.vim'

" Python autocomopletion - TODO try this out - need to know my <leader> key
"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

