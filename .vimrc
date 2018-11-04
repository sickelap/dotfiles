set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sheerun/vim-polyglot'
"Plugin 'sickelap/syntastic'
Plugin 'bling/vim-airline'
"Plugin 'albfan/nerdtree' " scorooloose/nerdtree fork to support gitignore
"Plugin 'albfan/nerdtree-git-plugin'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'clausreinke/typescript-tools.vim'
Plugin 'wakatime/vim-wakatime'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'ternjs/tern_for_vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Shougo/vimproc'
Plugin 'Quramy/tsuquyomi'
call vundle#end()

let base16colorspace=256
set t_Co=256
set hidden
set nocompatible
set noswapfile
set pastetoggle=<F2>
set splitright
set mouse=a
"set expandtab
"set shiftwidth=2
"set softtabstop=2
"set backspace=2
set autoindent
set smartindent
set laststatus=2
set number
set viminfo='20,<1000 " increase copy buffer size
set diffopt=vertical
set cursorline
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
filetype plugin indent on
syntax on

noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" utf-8 support
set encoding=utf-8
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" -- visual sugar
" highlight current line
hi cursor ctermbg=darkgray ctermfg=black cterm=none
hi cursorline cterm=none
hi cursorlinenr ctermfg=lightgray
hi cursorlinenr ctermbg=darkgray
" highlight characters after more than 150 characters
" XXX: should we support per filetype rules ?
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>150v.\+', -1)

" minibuf explorer
let g:miniBufExplForceSyntaxEnable = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg


" Oh clippy....
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" obviously
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Format with <Ctrl-f>
autocmd FileType * noremap <buffer> <c-f> :Autoformat<cr>

" <F3> to select and search current word
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

" learn home row
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>

" #################################
" Plugins
" #################################

" == CtrlP ========================
" ignore files that are in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" open multiple files in tabs and open first one in current tab
let g:ctrlp_open_multiple_files = 'tr'

" == gitgutter ====================
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
let g:gitgutter_max_signs = 1000

" == YouCompleteMe ================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" linter args for typescript (tsc)
"let g:syntastic_extprog_tsc_args="-t es5 --module commonjs --experimentalDecorators --emitDecoratorMetadata"
let g:syntastic_html_checkers=['']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" == airline ======================
let g:airline#extensions#tabline#enabled = 1

