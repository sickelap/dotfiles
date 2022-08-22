nmap <leader>sv :source $HOME/.vim/vimrc<CR>

nnoremap <M-CR> :lua vim.lsp.buf.code_action()<CR>
if has('mac')
  " <F14> on mac maps to <S-F6> (Shift+F6)
  nnoremap <F14> :lua vim.lsp.buf.rename()<CR>
else
  nnoremap <S-F6> :lua vim.lsp.buf.rename()<CR>
endif

au FileType typescript,javascript nnoremap gd :lua vim.lsp.buf.definition()<CR>

" move lines/blocks
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <C-L> :bn<CR>
nnoremap <C-H> :bp<CR>
inoremap <C-L> :bn<CR>
nnoremap <C-H> :bp<CR>
