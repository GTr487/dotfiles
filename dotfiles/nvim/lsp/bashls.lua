local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local M = {
    cmd = {
        "bash-language-server",
        "start"
    },
    filetypes = {
        "sh",
        "bash",
    },
    root_markers = {
        ".git",
    },
    capabilities = capabilities,
    settings = {
    }
}

return M
