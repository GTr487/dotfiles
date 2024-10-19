return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	init = function()
		vim.g.tmux_navigation_no_mappings = 1
	end,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
	},
}
