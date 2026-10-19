return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
        { "<leader>sf", "<cmd>FzfLua files<cr>", desc = "Find files" },
        { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
        { "<leader>sd", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document diagnostics" },
        { "<leader>sB", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
        { "<leader>sc", "<cmd>FzfLua highlights<cr>", desc = "Highlights" },
        { "<leader>sG", "<cmd>FzfLua grep_visual<cr>", desc = "Grep", mode = "x" },
        { "<leader>sr", "<cmd>FzfLua oldfiles<cr>", desc = "Recently opened files" },
        { "<leader>f<", "<cmd>FzfLua resume<cr>", desc = "Resume last fzf command" },
        { "z=", "<cmd>FzfLua spell_suggest<cr>", desc = "Spelling suggestions" },
    },
    opts = {
    },
}
