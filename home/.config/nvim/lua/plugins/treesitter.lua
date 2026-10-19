return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "cmake",
            "gitcommit",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "toml",
            "vim",
            "vimdoc",
        },

        -- Install parsers asynchronously (applies to ensure_installed)
        sync_install = false,

        -- Install missing pasers when entering buffer
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },

        indent = { enable = true },
    },
}
