-- Options that differ from LazyVim defaults
-- LazyVim sets sensible defaults; only override what you need

local opt = vim.opt

-- Display
opt.colorcolumn = "120" -- Show column guide
opt.wrap = false -- Don't wrap lines

-- Indentation (LazyVim defaults to 2 spaces, which is fine)
-- Uncomment if you want different:
-- opt.tabstop = 4
-- opt.shiftwidth = 4

-- Disable swap files (using git for recovery)
opt.swapfile = false
