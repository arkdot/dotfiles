-- Restart nvim.
vim.keymap.set("n", "<leader>R", "<cmd>restart<CR>")

-- Cursor doesn"t move when merging lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Keeping the cursor centered.
vim.keymap.set({"n", "v"}, "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set({"n", "v"}, "<C-s>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })

-- Copy to system/vi buffer.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Clear highlights on search when pressing <Esc> in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostics in a floating window
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { desc = "[O]pen [D]iagnostics" })

-- Replace string in a line
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Replace string in a file
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Paste over selection preserving the clipboard
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selection" })

-- Write all buffers
vim.keymap.set("n", "<leader>w", ":wa<CR>", { silent = false })
