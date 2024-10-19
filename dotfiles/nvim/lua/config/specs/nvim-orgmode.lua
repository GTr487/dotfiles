return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
			org_todo_keywords = { "TODO", "DOING", "|", "DONE" },
			org_todo_keyword_faces = {
				DOING = ":foreground #00FFC8 :weight bold",
			},
		})

		vim.keymap.set("n", "<leader>of", ":Telescope find_files cwd=~/orgfiles<CR>")

		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
		-- add ~org~ to ignore_install
		-- require('nvim-treesitter.configs').setup({
		--   ensure_installed = 'all',
		--   ignore_install = { 'org' },
		-- })
	end,
}
