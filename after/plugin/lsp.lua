local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Cr>'] = cmp.mapping.confirm({ select = true, }),
    ['<S-Tab>'] = vim.NIL,
    ['<Tab>'] = vim.NIL,
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  }
})
