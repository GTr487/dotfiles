local M = {}

local file_path = vim.fn.stdpath("config") .. "/.draft"

function M.open_draft_window()
	local width = math.floor(vim.o.columns * 0.4)

	local buf = vim.fn.bufnr(file_path, true)
	vim.cmd("vsplit")
	vim.api.nvim_win_set_width(0, width)
	vim.api.nvim_set_current_buf(buf)

	vim.cmd("edit " .. file_path)

	vim.api.nvim_buf_set_option(buf, "swapfile", false)
	vim.api.nvim_buf_set_option(buf, "buflisted", false)

	vim.api.nvim_command("autocmd BufLeave <buffer> :w")
end

return M
