-- Bootstrap lazy.nvim and configure LazyVim
-- This file sets up the plugin manager and enables LazyVim extras

-- Set leader key before lazy.nvim loads (required for correct keymap setup)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim from GitHub if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with LazyVim as the base distribution
require("lazy").setup({
  spec = {
    -- LazyVim base distribution - provides sensible defaults
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Language support extras (replaces manual LSP config for common languages)
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.svelte" },

    -- Editor extras
    { import = "lazyvim.plugins.extras.editor.harpoon2" },

    -- UI extras
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },

    -- Grumpyvim custom plugins (loaded after LazyVim to override defaults)
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- Don't lazy-load by default for stability
    version = false, -- Use latest git commits (recommended by LazyVim)
  },
  install = {
    colorscheme = { "gruvbox", "habamax" }, -- Fallback colorschemes during install
  },
  checker = {
    enabled = true, -- Check for plugin updates
    notify = false, -- Don't spam notifications
  },
  change_detection = {
    enabled = true, -- Auto-reload on config changes
    notify = false, -- Don't spam notifications
  },
  performance = {
    rtp = {
      -- Disable unused built-in plugins for faster startup
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
