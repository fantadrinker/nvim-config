-- <space> + pv
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<C-i>', vim.diagnostic.open_float)
