nmap <leader>sv :source $HOME/.vim/vimrc<CR>

nnoremap <M-CR> :lua vim.lsp.buf.code_action()<CR>
if has('mac')
  " <F14> on mac maps to <S-F6> (Shift+F6)
  nnoremap <F14> :lua vim.lsp.buf.rename()<CR>
else
  nnoremap <S-F6> :lua vim.lsp.buf.rename()<CR>
endif

au FileType typescript,javascript nnoremap gd :lua vim.lsp.buf.definition()<CR>
