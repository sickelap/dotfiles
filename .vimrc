" must be set before ALE is loaded

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'prettier/vim-prettier'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'albfan/nerdtree' " scorooloose/nerdtree fork to support gitignore
Plugin 'albfan/nerdtree-git-plugin'
Plugin 'jiangmiao/auto-pairs'
Plugin 'clausreinke/typescript-tools.vim'
Plugin 'wakatime/vim-wakatime'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'autozimu/LanguageClient-neovim'
call vundle#end()

let base16colorspace=256
set t_Co=256
set hidden
set nocompatible
set noswapfile
set pastetoggle=<F2>
set splitright
"set mouse=a
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set autoindent
set smartindent
set laststatus=2
set number
set viminfo='20,<1000 " increase copy buffer size
set cursorline
filetype plugin indent on
syntax on

set encoding=utf-8
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

hi cursor ctermbg=darkgray ctermfg=black cterm=none
hi cursorline cterm=none
hi cursorlinenr ctermfg=lightgray
hi cursorlinenr ctermbg=darkgray
hi ColorColumn ctermbg=magenta
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v', 80)

let g:miniBufExplForceSyntaxEnable = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

let g:elite_mode=1

set clipboard^=unnamed
set clipboard^=unnamedplus

let mapleader = ","

autocmd FileType * noremap <buffer> <c-f> :Prettier<cr>

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
nmap <Leader>hr <Plug>GitGutterUndoHunk
let g:gitgutter_max_signs = 1000

" == YouCompleteMe ================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" linter args for typescript (tsc)
let g:syntastic_html_checkers=['']

" == airline ======================
let g:airline#extensions#tabline#enabled = 1

" == NERDTree =====================
nmap <Leader>n :NERDTreeToggle<CR>

" == Autoformat ===================
let g:formatters_js = ['prettier']
let g:formatters_ts = ['prettier']

" Language Server
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'python': ['pyls'],
  \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>}

" Emmet
autocmd FileType html,css,mustache imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" ALE
hi ALEError ctermbg=none cterm=underline
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['tsserver', 'tslint'],
  \   'vue': ['eslint']
  \}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier']
  \}
let g:ale_fix_on_save = 1

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:tsuquyomi_shortest_import_path = 1

