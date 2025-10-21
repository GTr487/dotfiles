-- core/options.lua
-- - Global options

local o = vim.opt


o.background = "dark"

-- UI
o.number = true
o.relativenumber = true
o.cursorline = false

o.termguicolors = true
o.signcolumn = "yes"
o.scrolloff = 10

-- Tabs
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true


-- filesystem
o.autoread = true
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"

-- panels
o.splitright = true
o.splitbelow = true
