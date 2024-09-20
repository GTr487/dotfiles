return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")

            dap.adapters.firefox = {
              type = 'executable',
              command = 'node',
              args = {os.getenv('HOME') .. '/.debugAdapter/vscode-firefox-debug/dist/adapter.bundle.js'},
            }

            dap.configurations.typescript = {
              {
                  name = 'Debug with Firefox',
                  type = 'firefox',
                  request = 'launch',
                  reAttach = true,
                  url = 'http://localhost:3000',
                  webRoot = '${workspaceFolder}',
                  firefoxExecutable = '/usr/bin/firefox'
              }
            }

            for _, language in ipairs {"typescript", "javascript"} do
                dap.configurations[language] = {
                      {
                          name = 'Debug with Firefox',
                          type = 'firefox',
                          request = 'launch',
                          reAttach = true,
                          url = 'http://localhost:3000',
                          webRoot = '${workspaceFolder}',
                          firefoxExecutable = '/usr/bin/firefox'
                      }
                }
            end

            vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require("dap").list_breakpoints()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua require("dap").stop()<CR>', { noremap = true, silent = true })


        end
    },
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
            end
        end
    }
}

