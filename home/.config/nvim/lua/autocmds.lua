-- Hightlight yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight selection on yank",
    group = vim.api.nvim_create_augroup("arkdot/highlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { timeout = 200 }
    end,
})
