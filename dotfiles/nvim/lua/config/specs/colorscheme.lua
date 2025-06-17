return {
	{
		"thedenisnikulin/vim-cyberpunk",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
      vim.o.background = "dark"
			vim.cmd([[colorscheme cyberpunk]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
		end,
	},
}
