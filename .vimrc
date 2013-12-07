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

" Indentation
set tabstop=4	" set tab to four spaces
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set autoindent	" set autoindent on
set copyindent	" copy prev indentation on autoindenting
set shiftwidth=4	" number of spaces to use for autoindenting
set shiftround	" use multiple of shiftwidth when indenting with '<' and '
set smarttab	" insert tabs on the start of a line according to shiftwidth, not tabstop

" Search
set showmatch	" set show matching parenthesis
set ignorecase	" ignore case when search
set smartcase	" ignore case if search pattern is all lower case, case sensitive if otherwise
set hlsearch	" highlight search terms
set incsearch	" show search matches as you type

" Wrapping
set nowrap

" Statusline
set laststatus=2	" always display statusline
set statusline=%t	" tail of the filename 
set statusline+=[%{strlen(&fenc)?&fenc:'none'},	"file encoding
set statusline+=%{&ff}]	"file format
set statusline+=%h	"help file flag
set statusline+=%m	"modified flag
set statusline+=%r	"read only flag
set statusline+=%y	"filetype
set statusline+=%=	"switch to right side
set statusline+=%c,	"cursor column
set statusline+=\%l/%L	"cursor line/total lines
set statusline+=\ %P	"percent through file

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
nnoremap <C-w> :wq!<cr>
inoremap <C-w> <esc>:wq!<cr>

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

" Use ctrl+j to insert new line in normal mode without entering insert mode
nnoremap <C-j> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR> 

" Use ctrl+l to clear the search highlight
nnoremap <silent> <c-l> :nohls<cr>

" Pastetoggle, useful if paste code from outside application.
" Use only in vim terminal, if in GUI set toggle off.
" Map toggle to ctrl+t
nnoremap <c-t> :set invpaste paste?<cr>
set pastetoggle=<c-t>
set showmode

" Abbreviations
" typos
iabbrev adn and
iabbrev tehn then

iabbrev @@ nauval.atmaja@gmail.com
iabbrev @@1 noval.78@gmail.com
iabbrev @@a @author Nauval Atmaja

" Autocommands -------------------------------------{{{
augroup filetype_js
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
augroup END
" Vimscript file setting ----------------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" }}}

