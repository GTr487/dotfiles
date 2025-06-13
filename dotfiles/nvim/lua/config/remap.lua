vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Resize windows using leader + J/K/H/L
vim.keymap.set("n", "<leader>K", "<cmd>resize +2<CR>", { noremap = true, silent = true })          -- Increase vertical size
vim.keymap.set("n", "<leader>J", "<cmd>resize -2<CR>", { noremap = true, silent = true })          -- Decrease vertical size
vim.keymap.set("n", "<leader>H", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true }) -- Decrease horizontal size
vim.keymap.set("n", "<leader>L", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true }) -- Increase horizontal size

-- splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

-- Move blocks in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Combine lines without losing cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Center scroll when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the cursor when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Easily restart LSP
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Paste without overwriting the clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Exit insert mode with Ctrl+c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Replace the word under the cursor throughout the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Custom function
vim.keymap.set("n", "<leader>ed", function()
  require("custom.draft").open_draft_window()
end)

-- Reload the current configuration
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
