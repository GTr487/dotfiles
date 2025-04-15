return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = false,
      format_on_save_timeout_ms = 1000,
    })
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        if vim.g.format_on_save_enabled then
          conform.format({
            lsp_fallback = true,
            async = true,
            timeout_ms = 1000,
          })
        end
      end
    })
    vim.keymap.set("n", "<leader>fs", function()
      vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
      if vim.g.format_on_save_enabled then
        vim.notify("ENABLED", vim.log.levels.INFO, { title = "Fromat on save" })
      else
        vim.notify("DISABLED", vim.log.levels.WARN, { title = "Fromat on save" })
      end
    end, { desc = "Toggle format on save" })
  end,
}
