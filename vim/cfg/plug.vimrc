call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdtree'
    
    Plug 'editorconfig/editorconfig-vim'
    Plug 'sbdchd/neoformat'
    "Plug 'sheerun/vim-polyglot'
    "Plug 'pearofducks/ansible-vim'

    Plug 'dense-analysis/ale'
    if has('nvim')
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
    else
        Plug 'kien/ctrlp.vim'
    endif

    Plug 'gruvbox-community/gruvbox'
    Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()
