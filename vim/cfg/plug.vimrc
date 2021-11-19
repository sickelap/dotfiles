call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdtree'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'sbdchd/neoformat'
  "Plug 'sheerun/vim-polyglot'
  "Plug 'pearofducks/ansible-vim'

  "Plug 'dense-analysis/ale'
  if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'

    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  else
    Plug 'kien/ctrlp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
  endif

  Plug 'gruvbox-community/gruvbox'
  Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()
