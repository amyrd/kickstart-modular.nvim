vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.conceallevel = 1

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'
require 'obsidian'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
require('lspconfig').clangd.setup {
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    'clangd',
    '--offset-encoding=utf-16',
  },
}
-- vim: ts=2 sts=2 sw=2 et
