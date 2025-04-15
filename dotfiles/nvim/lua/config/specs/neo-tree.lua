return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        width = 32,
        mappings = {
          ["?"] = "show_help",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        color = {
          ignored = "grey",
        }
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end
        },
      },
      default_component_configs = {
        filesystem = {
          expand_all = true,
        }
      }
    })
    vim.keymap.set("n", "<leader>pv", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
  end
}
