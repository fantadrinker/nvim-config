-- <space> + pv
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<C-i>', vim.diagnostic.open_float)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
