require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "python", "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
