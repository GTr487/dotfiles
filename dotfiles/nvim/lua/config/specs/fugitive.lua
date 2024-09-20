return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		vim.api.nvim_set_keymap("n", "<leader>nc", ":]c<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pc", ":[c<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<leader>df", ":diffget //2<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>dj", ":diffget //3<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<leader>do", ":diffoff<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ww", ":GWrite<CR>", { noremap = true, silent = true })
	end,
}
