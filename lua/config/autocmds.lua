-- Grumpyvim autocommands
-- Custom autocommands layered on top of LazyVim defaults

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Create a group for grumpyvim-specific autocommands
local grumpyvim = augroup("grumpyvim", { clear = true })

-- Disable folding on dashboard (snacks.dashboard in LazyVim)
autocmd("FileType", {
  group = grumpyvim,
  pattern = "snacks_dashboard",
  callback = function()
    vim.opt_local.foldenable = false
  end,
  desc = "Disable folding on dashboard",
})

-- Auto-resize windows when terminal is resized
autocmd("VimResized", {
  group = grumpyvim,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  desc = "Auto-resize windows on terminal resize",
})

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  group = grumpyvim,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
  desc = "Highlight yanked text",
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
  group = grumpyvim,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Return to last edit position",
})
