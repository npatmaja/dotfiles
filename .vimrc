" This is my personal .vimrc, feel free to use it with your own risk.

call pathogen#infect()

" Set not compatible with vi. This is useful for 
" consecutive undo and others
set nocompatible

" load filetype plugins/indent settings
filetype plugin indent on

" Syntax highlight
syntax on

" Uses dark background
set background=dark

" Solarized
"colorscheme solarized
"let g:solarized_termcolors= 256 
"let g:solarized_termtrans = 1
"let g:solarized_degrade = 0 
"let g:solarized_bold = 0 
"let g:solarized_underline = 0
"let g:solarized_italic = 0
"let g:solarized_contrast = \"normal" 
"let g:solarized_visibility= \"normal"


" Vim Javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

