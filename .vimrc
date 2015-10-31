filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'janko-m/vim-test'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1

syntax on
set hidden
set nocompatible
set modelines=0		" CVE-2007-2438
set noswapfile
set pastetoggle=<F2>
set splitright
set mouse=a
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2		" more powerful backspacing
set autoindent
set smartindent
set laststatus=2
set number
set viminfo='20,<1000 " increase copy buffer size
set diffopt=vertical
set cursorline
hi CursorLine ctermbg=darkgray ctermfg=none cterm=none

let mapleader = ","

"nnoremap <Up> <NOP>
"nnoremap <Down> <NOP>
"nnoremap <Left> <NOP>
"nnoremap <Right> <NOP>

au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)

set omnifunc=syntaxcomplete#Complete

let g:ctrlp_custom_ignore = { 'dir' : '\v[\/](target|node_modules)' }

noremap <buffer>  <c-f> :Autoformat<cr>
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"autocmd FileType css,scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
"autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
"autocmd FileType css,scss vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let g:miniBufExplForceSyntaxEnable = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:gitgutter_max_signs = 1000

let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
    let @/ = '\<'.expand('<cword>').'\>'
    let g:highlighting = 1
    return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <F3> Highlighting()
":nnoremap <F3> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

imap <C-Space> <Plug>snipMateNextOrTrigger

" gitgutter - hunk navigation
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
