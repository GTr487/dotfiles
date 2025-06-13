return {
  "nvim-orgmode/orgmode",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "org" },
  config = function()
    local home = os.getenv("HOME")
    local org_path = home .. "/worknotes/org"

    -- Autoreload si hay cambios externos (Syncthing, etc.)
    vim.o.autoread = true
    vim.cmd([[
      autocmd FocusGained,BufEnter * checktime
    ]])

    -- Keybindings globales
    vim.keymap.set("n", "<leader>of", ":Telescope find_files cwd=" .. org_path .. "<CR>", { desc = "Buscar en vault/org" })

    vim.keymap.set("n", "<leader>od", function()
      if vim.fn.winnr('$') == 1 then
        vim.cmd("vsplit")
      else
        vim.cmd("rightbelow vsplit")
      end
      vim.cmd("e " .. org_path)
    end, { desc = "Abrir directorio org en split lateral" })


    require("orgmode").setup({
      org_agenda_files = { org_path .. "/**/*" },
      org_default_notes_file = org_path .. "/refile.org",

      -- Estados personalizados
      org_todo_keywords = { "TODO", "DOING", "WAITING", "|", "DONE", "CANCELLED" },
      org_todo_keyword_faces = {
        DOING     = ":foreground #00FFC8 :weight bold",
        WAITING   = ":foreground #FFD700 :weight bold",
        CANCELLED = ":foreground #888888 :slant italic",
      },

      win_split_mode = "vertical",  -- abre capturas/agendas en split automático
    })
  end,
}
