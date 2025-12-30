-- Grumpyvim options
-- These are layered on top of LazyVim's sensible defaults
-- LazyVim already sets many of these, but we override where our preferences differ

local o = vim.opt

-- Colors & appearance
o.termguicolors = true -- Enable 24-bit RGB colors (required for modern colorschemes)
o.background = "dark" -- Always use dark mode

-- Indentation (LazyVim defaults to 2 spaces, we keep that)
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true -- Convert tabs to spaces
o.autoindent = true
o.smartindent = true

-- Line width
o.textwidth = 160 -- Wider than default for modern monitors

-- Line numbers (LazyVim enables these, but we ensure our preferred style)
o.relativenumber = true -- Relative line numbers for easy jumping
o.number = true -- Show absolute number on cursor line

-- Visual
o.cursorline = true -- Highlight current line
o.wrap = false -- No line wrapping
o.signcolumn = "yes:1" -- Fixed-width sign column prevents layout shift

-- Editing
o.backspace = "eol,start,indent" -- Make backspace behave intuitively

-- Search (LazyVim sets these, but we ensure they're set)
o.ignorecase = true -- Case-insensitive search
o.smartcase = true -- Unless search contains uppercase

-- Window splitting
o.splitright = true -- New vertical splits go right
o.splitbelow = true -- New horizontal splits go below

-- System integration
o.clipboard:append("unnamedplus") -- Use system clipboard

-- Files
o.swapfile = false -- Disable swap files (use git instead)
