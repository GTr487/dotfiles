-- core/autocmds.lua
-- - Auto events

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end,
    desc = "Resalta al hacer yank"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.cmd("wincmd L")
    end,
    desc = "Ventana de ayuda a la derecha"

})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(args)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                noremap = true,
                silent = true,
                buffer = args.buf,
                desc = "LSP: " .. desc
            })
        end

        -- Navegación
        map("n", "<leader>gd", vim.lsp.buf.definition, "Ir a definición")
        map("n", "<leader>gD", vim.lsp.buf.declaration, "Ir a declaración")
        map("n", "<leader>gr", vim.lsp.buf.references, "Ver referencias")
        map("n", "<leader>gi", vim.lsp.buf.implementation, "Ir a implementación")
        map("n", "K", vim.lsp.buf.hover, "Hover")

        -- Acciones de código
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Acción de código")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Renombrar símbolo")
        map("v", "<leader>ca", function() vim.lsp.buf.range_code_action() end, "Acción de código en rango")

        -- Diagnósticos
        map("n", "<leader>ds", vim.diagnostic.open_float, "Mostrar diagnóstico")
        map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Diagnóstico previo")
        map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Siguiente diagnóstico")
        map("n", "<leader>dl", vim.diagnostic.setloclist, "Poner diagnósticos en lista")

        -- Formateo
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Formatear buffer")
    end,
})
