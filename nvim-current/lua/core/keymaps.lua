vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-L>", ":bn<CR>")
vim.keymap.set("n", "<C-H>", ":bp<CR>")
vim.keymap.set("i", "<C-L>", ":bn<CR>")
vim.keymap.set("i", "<C-H>", ":bp<CR>")

vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR><C-w><C-w>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFileToggle<CR>")

vim.keymap.set("n", "<C-[>", ":bp<CR>");
vim.keymap.set("n", "<C-]>", ":bn<CR>");

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.autoread = true
-- vim.opt.hidden = true
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true
-- vim.opt.smarttab = true
-- vim.opt.autoindent = true
-- vim.opt.wrap = false


