local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local M = {
    cmd = {
        "lua-language-server"
    },
    filetypes = {
        "lua",
    },
    root_markers = {
        ".git",
        "init.lua",
    },
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },

            telemetry = {
                enable = false,
            },
        },
    },
}

return M
