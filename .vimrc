" This is my personal .vimrc, feel free to use it with your own risk. 

" Set not compatible with vi. This is useful for 
" consecutive undo and others
set nocompatible

" Use pathogen
call pathogen#infect()

" set leaders
let mapleader = ","
let maplocalleader = "."

" load filetype plugins/indent settings
filetype plugin indent on

" Syntax highlight
syntax on

" Uses dark background
set background=dark

" Show line numbers
set number numberwidth=4 

" Remove annoying beeps
set visualbell
set noerrorbells

" Don't create backup file
set nobackup
set noswapfile

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

" Key mappings
" Save file to ctrl+s
nnoremap <C-s> :w<cr>  
inoremap <C-s> <esc>:w<cr>a

" Quit vim, 'ctrl+q' to quit without save
nnoremap <C-q> :q!<cr>
inoremap <C-q> <esc>:q!<cr>
" Save then quit
nnoremap <C-w> :wq<cr>
inoremap <C-w> <esc>:wq<cr>

" Fast edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move line up and down, ref http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
" alt+k to move one line up
nnoremap ˚ :m .-2<cr>==
inoremap ˚ <esc>:m .-2<cr>==gi
" alt+j to move one line down 
nnoremap ∆ :m .+1<cr>== 
inoremap ∆ <esc>:m .+1<cr>==gi

" Surround a word with double quote
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Surround a word with single quote
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Use H to go to the beginning of a line, L to the end of a line
nnoremap H ^
nnoremap L $

" Disable escape keys, use jk instead
inoremap <esc> <nop>
inoremap jk <esc>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <right> <nop>

inoremap OA <nop>
inoremap OC <nop>
inoremap OB <nop>
inoremap OD <nop>


" Abbreviations
" typos
iabbrev adn and
iabbrev tehn then

iabbrev @@ nauval.atmaja@gmail.com
iabbrev @@1 noval.78@gmail.com
iabbrev @a @author Nauval Atmaja

" Autocommands
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType javascript nnoremap <buffer> <localleader>C I/**<cr>*<cr>*<cr>**/<esc>
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
