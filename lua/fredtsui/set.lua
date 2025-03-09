vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.diagnostic.config({
  virtual_text = true
})

require 'lspconfig'.pyright.setup {}
