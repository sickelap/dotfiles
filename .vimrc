set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sheerun/vim-polyglot'
Plugin 'sickelap/syntastic'
Plugin 'bling/vim-airline'
Plugin 'albfan/nerdtree' " scorooloose/nerdtree fork to support gitignore
Plugin 'albfan/nerdtree-git-plugin'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'clausreinke/typescript-tools.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
call vundle#end()

set hidden
set nocompatible
set modelines=0
set noswapfile
set pastetoggle=<F2>
set splitright
set mouse=a
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
set autoindent
set smartindent
set laststatus=2
set number
set viminfo='20,<1000 " increase copy buffer size
set diffopt=vertical
set cursorline
filetype plugin indent on
syntax on

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
hi CursorLine ctermbg=darkgray ctermfg=none cterm=none
" highlight characters that goes above 120 characters
" XXX: should we support filetypes ?
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)

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

" == NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" == CtrlP ========================
" ignore files that are in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"let g:ctrlp_cmd = 'CtrlPMRU'
"let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
""  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
"" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_max_height = 10		" maxiumum height of match window
"let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
"let g:ctrlp_mruf_max=450 		" number of recently opened files
"let g:ctrlp_max_files=0  		" do not limit the number of searchable files
"let g:ctrlp_use_caching = 1
"let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"
"let g:ctrlp_buftag_types = {
"      \ 'go'     	   : '--language-force=go --golang-types=ftv',
"      \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
"      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
"      \ 'objc'       : '--language-force=objc --objc-types=mpci',
"      \ 'rc'         : '--language-force=rust --rust-types=fTm'
"      \ }
"
"func! MyCtrlPTag()
"  let g:ctrlp_prompt_mappings = {
"        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"        \ 'AcceptSelection("t")': ['<c-t>'],
"        \ }
"  CtrlPBufTag
"endfunc
"command! MyCtrlPTag call MyCtrlPTag()
"
"nmap <C-f> :CtrlPCurWD<cr>
"imap <C-f> <esc>:CtrlPCurWD<cr>
"
"nmap <C-b> :CtrlPBuffer<cr>
"imap <C-b> <esc>:CtrlPBuffer<cr>

" == gitgutter ====================
" hunk navigation
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

let g:gitgutter_max_signs = 1000


" == YouCompleteMe ================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" == Fugitive =====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>
" == syntastic ====================

" linter args for typescript (tsc)
let g:syntastic_extprog_tsc_args="--module commonjs --experimentalDecorators -t es5 --moduleResolution node --emitDecoratorMetadata"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" == airline ======================
let g:airline#extensions#tabline#enabled = 1

" == UltiSnips ====================

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" ###################
"set omnifunc=syntaxcomplete#Complete
"autocmd FileType * noremap <buffer> <c-f> :Autoformat<cr>

"nnoremap <Up> <NOP>
"nnoremap <Down> <NOP>
"nnoremap <Left> <NOP>
"nnoremap <Right> <NOP>

