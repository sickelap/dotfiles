nnoremap <leader>h :noh<CR>

nmap <leader>sp :call SynStack()<CR>

nmap <leader>sv :source $HOME/.vim/vimrc<CR>

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
