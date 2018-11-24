set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'wakatime/vim-wakatime'
Plugin 'chriskempson/base16-vim'
call vundle#end()

let base16colorspace=256
set t_Co=256
set hidden
set nocompatible
set noswapfile
set pastetoggle=<F2>
set splitright
set mouse=
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

hi cursor ctermbg=darkgray ctermfg=black cterm=none
hi cursorline cterm=none
hi cursorlinenr ctermfg=lightgray
hi cursorlinenr ctermbg=darkgray
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v')

let g:miniBufExplForceSyntaxEnable = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

let mapleader = ","

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" == CtrlP ========================
" ignore files that are in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" open multiple files in tabs and open first one in current tab
let g:ctrlp_open_multiple_files = 'tr'

" == gitgutter ====================
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
let g:gitgutter_max_signs = 1000

" == airline ======================
let g:airline#extensions#tabline#enabled = 1

