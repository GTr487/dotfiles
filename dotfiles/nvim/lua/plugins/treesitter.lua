return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "lua",
            "luadoc",
            "bash",
            "c",
            "cpp",
            "cmake",
            "comment",
            "diff",
            "disassembly",
            "gdscript",
            "go",
            "http",
            "make",
            "markdown",
            "markdown_inline",
            "regex",
        },
        indent = { enable = true },
        highlight = { enable = true },
        auto_install = true,
    })
    end,
}
