vim.lsp.enable({
    "lua_ls",
    "bashls",
})

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})
