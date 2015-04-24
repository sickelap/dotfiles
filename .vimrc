" formatting
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2		" more powerful backspacing
set autoindent
set smartindent
set laststatus=2
filetype plugin indent on

set cursorline
"hi CursorLine ctermbg=gray ctermfg=white cterm=none
hi CursorLine ctermbg=darkgray cterm=none

"match ErrorMsg '\%>120v.\+’
"au BufWinEnter * let w:m1=matchadd('Search', '\%<121v.\+', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)

" show line numbers
set number

" general
syntax on
set hidden
set nocompatible
set modelines=0		" CVE-2007-2438
set noswapfile
set pastetoggle=<F2>
set splitbelow
set splitright
set mouse=a

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'jaxbot/browserlink.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Plugin 'honza/vim-snippets'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'fholgado/minibufexpl.vim'
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete

set runtimepath^=~/.vim/bundle/vim-snippets,~/.vim/bundle/ctrlp.vim

" Ctrl-P
"set wildignore+=node_modules/*,target/*,*/tmp/*,*.so,*.swp,*.zip 
"let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = { 'dir' : '\v[\/](target|node_modules)' }

au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.json set filetype=javascript

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css,scss noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css,scss vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" buffers
:noremap <C-left> :bprev<CR>
:noremap <C-right> :bnext<CR>
let g:miniBufExplForceSyntaxEnable = 1

" Emmet (Zen)
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim_snippets.json')), "\n"))

" git diff
"nnoremap <C-D> :GitGutterToggle<cr>
"nnoremap <C-d> :GitGutterLineHighlightsToggle<cr>

" shortcut to jump to next window
nnoremap <C-W> <C-W><C-W>

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
