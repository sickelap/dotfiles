" formatting
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2		" more powerful backspacing
set autoindent
set smartindent

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

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

execute pathogen#infect()
call pathogen#helptags()

" train yourself
"nnoremap <Left> :echoe "DOH! Train yourself! Use h"<CR>
"nnoremap <Right> :echoe "DOH! Train yourself! Use l"<CR>
"nnoremap <Up> :echoe "DOH! Train yourself! Use k"<CR>
"nnoremap <Down> :echoe "DOH! Train yourself! Use j"<CR>

" Ctrl-P
"set wildignore+=node_modules/*,target/*,*/tmp/*,*.so,*.swp,*.zip 
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = { 'dir' : '\v[\/](target|node_modules)' }

au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.scss set filetype=css

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" buffers
":noremap <C-left> :bprev<CR>
":noremap <C-right> :bnext<CR>
"let g:miniBufExplForceSyntaxEnable = 1

" Emmet (Zen)
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" git diff
nnoremap <C-D> :GitGutterToggle<cr>
nnoremap <C-d> :GitGutterLineHighlightsToggle<cr>
