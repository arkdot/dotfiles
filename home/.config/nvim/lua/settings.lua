-- Set <space> as the leader key.
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used).
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Fat cursor.
vim.opt.guicursor = ""

-- Relative line numbering.
vim.opt.number = true
vim.opt.relativenumber = true

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indent with 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set tab spacing to 2 spaces for HTML files.
vim.cmd([[
  autocmd FileType html,htmldjango,css,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
]])

-- Do not wrap lines
vim.opt.wrap = false

-- Search is case-sensitive only if search string contains an uppercase character.
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Always at least 10 lines above and below the cursor.
vim.opt.scrolloff = 10

-- Vertical line at 110 characters.
vim.opt.colorcolumn = "110"

-- Reserve a space in the gutter.
-- Displays the sign column which is used to show signs errors and warnings.
-- This will avoid an annoying layout shift in the screen.
vim.opt.signcolumn = "yes"

-- Decrease update time.
vim.o.updatetime = 250

-- Decrease mapped sequence wait time.
vim.o.timeoutlen = 300

-- Use true colors
vim.o.termguicolors = true

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})
