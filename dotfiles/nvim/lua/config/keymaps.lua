-- core/keymaps.lua
-- - General Keybindigns

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<leader>h", ":nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Limpiar resultados de busqueda" }))

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>s", ":split<CR>", opts)
-- TODO: Cambiar por buffers
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>to", ":tabonly<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>tm", ":tabnext<CR>", opts)
map("n", "<leader>tp", ":tabprevious<CR>", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map({"n","v"}, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)
map("n", "<leader>p", '"+p', opts)


map("n", "<leader><leader>", function()
	dofile(vim.fn.stdpath("config") .. "/init.lua")
	print("Config reloaded!")
end, vim.tbl_extend("force", opts, { desc = "Recargar config" }))
