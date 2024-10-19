local g = vim.g
local opt = vim.opt

-- Editing and Spacing
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Number of spaces for each indentation level
opt.tabstop = 2 -- Number of spaces a tab character represents
opt.softtabstop = 2 -- Number of spaces a tab character represents in insert mode

-- Search and Highlight
opt.hlsearch = false -- Disable search result highlighting
opt.incsearch = true -- Enable incremental search

-- Appearance and Colors
opt.termguicolors = true -- Enable True Color support
opt.colorcolumn = "80" -- Show vertical line at column 80
opt.cursorline = true -- Highlight the line where the cursor is
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.wrap = false -- Display lines as one long line
opt.signcolumn = "yes" -- Show the sign column

-- Windows and Splits
opt.splitbelow = true -- Open horizontal splits below the current window
opt.splitright = true -- Open vertical splits to the right of the current window

-- Persistence and Undo
opt.undofile = true -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files

-- Language and Text
opt.smartcase = true -- Smart case sensitivity for search
opt.smartindent = true -- Intelligent auto-indentation
opt.isfname:append("@-@") -- Include @-@ in filenames for operations

-- Other
opt.scrolloff = 8 -- Maintain 8 lines of context above and below the cursor
opt.showmatch = true -- Highlight matching parentheses
opt.updatetime = 50 -- Set update interval for events
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
opt.conceallevel = 2
opt.concealcursor = "nc"
