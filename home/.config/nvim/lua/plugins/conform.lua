-- Autoformat
return {
  "stevearc/conform.nvim",
  -- event = "BufWritePre", -- Autoformat on save
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = false,
  },
}
