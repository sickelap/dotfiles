set nocompatible
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set nobackup
set autoindent
filetype plugin indent on
syntax on

" display line numbers
set number

" show bottom ruler
set ruler

map <D-p> set paste
map <D-P> set nopaste

nnoremap <M-[> <<
nnoremap <M-]> >>
nnoremap <M-l> gg=G

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

