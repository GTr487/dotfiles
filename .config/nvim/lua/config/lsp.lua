local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      "luau-lsp",                     -- lua
      "clangd",                     -- c++
      "java_language_server",       -- java
      "bashls",                     -- bash
      "eslint",                     -- HTML|CSS|JSON|JS|TS
      "sqls",                       -- SQL
      "yamlls",                     -- YAML
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
