-- Grumpyvim keymaps
-- These are layered on top of LazyVim's defaults
-- We keep grumpyvim's preferred bindings and override LazyVim where they conflict
-- Note: LazyVim uses Snacks.picker for fuzzy finding (not telescope or fzf-lua)

local km = vim.keymap

-- ============================================================================
-- SHORTCUTS
-- ============================================================================

-- Quick escape from insert mode (LazyVim doesn't set this)
km.set("i", "jj", "<ESC>", { desc = "Escape from insert mode" })

-- Quick quit
km.set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit Vim" })

-- Show all keymaps (uses Snacks.picker in LazyVim)
km.set("n", "<leader>?", function()
  Snacks.picker.keymaps()
end, { desc = "Show all keymappings" })

-- ============================================================================
-- WINDOWS (leader-w prefix)
-- ============================================================================

-- Window splits (grumpyvim uses w| and w-, LazyVim uses | and -)
km.set("n", "<leader>w|", "<C-w>v", { desc = "Split window right" })
km.set("n", "<leader>w-", "<C-w>s", { desc = "Split window below" })
km.set("n", "<leader>we", "<C-w>=", { desc = "Equalize window sizes" })
km.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close current window" })
km.set("n", "<leader>wm", "<cmd>lua Snacks.toggle.zoom()<CR>", { desc = "Maximize window toggle" })

-- Session management (uses persistence.nvim in LazyVim)
km.set("n", "<leader>ws", function()
  require("persistence").save()
end, { desc = "Save session" })
km.set("n", "<leader>wr", function()
  require("persistence").load()
end, { desc = "Restore session" })

-- ============================================================================
-- TABS (leader-t prefix)
-- Note: LazyVim uses <leader><tab> for tab menu, we override that for prev file
-- ============================================================================

-- Tab picker moved here (was <leader><tab> in LazyVim)
km.set("n", "<leader>t", "<cmd>tabs<CR>", { desc = "List tabs" })
km.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
km.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close tab" })
km.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Next tab" })
km.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Previous tab" })
km.set("n", "<leader>ts", "<cmd>BufferLinePick<CR>", { desc = "Select buffer by key" })

-- ============================================================================
-- FILE NAVIGATION (leader-p prefix for "project")
-- Grumpyvim uses p prefix, LazyVim uses f prefix
-- ============================================================================

-- Toggle previous file (override LazyVim's tab menu on <leader><tab>)
km.set("n", "<leader><tab>", "<C-^>", { desc = "Toggle previous file" })

-- Project tree (neo-tree in LazyVim)
km.set("n", "<leader>pt", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
km.set("n", "<leader>pc", "<cmd>Neotree close<CR>", { desc = "Close file tree" })

-- File finding (Snacks.picker in LazyVim)
km.set("n", "<leader>pf", function()
  Snacks.picker.files()
end, { desc = "Find file in project" })
km.set("n", "<leader>pr", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })
km.set("n", "<leader>pw", function()
  Snacks.picker.grep_word()
end, { desc = "Search word under cursor" })
km.set("n", "<leader>pb", function()
  Snacks.picker.buffers()
end, { desc = "Show buffers" })
km.set("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Search project" })

-- Project selection (uses project.nvim)
km.set("n", "<leader>pp", function()
  Snacks.picker.projects()
end, { desc = "Select project" })

-- ============================================================================
-- GIT (leader-g prefix)
-- ============================================================================

-- Quick git commands (vim-fugitive)
km.set("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "Git status" })
km.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
km.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Git diff" })

-- LazyGit TUI (same as LazyVim)
km.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- ============================================================================
-- HARPOON (leader-h prefix)
-- Uses harpoon2 from LazyVim extras
-- ============================================================================

km.set("n", "<leader>ha", function()
  require("harpoon"):list():add()
end, { desc = "Harpoon: mark file" })

km.set("n", "<leader>hs", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: show marks" })

km.set("n", "<leader>hl", function()
  require("harpoon"):list():next()
end, { desc = "Harpoon: next file" })

km.set("n", "<leader>hh", function()
  require("harpoon"):list():prev()
end, { desc = "Harpoon: previous file" })

-- Quick access to first 4 harpooned files
km.set("n", "<leader>h1", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon: file 1" })
km.set("n", "<leader>h2", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon: file 2" })
km.set("n", "<leader>h3", function()
  require("harpoon"):list():select(3)
end, { desc = "Harpoon: file 3" })
km.set("n", "<leader>h4", function()
  require("harpoon"):list():select(4)
end, { desc = "Harpoon: file 4" })

-- ============================================================================
-- LSP (leader-l prefix)
-- Grumpyvim uses l prefix, LazyVim uses g* and c* prefix
-- We keep grumpyvim's convention
-- ============================================================================

km.set("n", "<leader>lr", function()
  Snacks.picker.lsp_references()
end, { desc = "LSP: references" })
km.set("n", "<leader>lg", vim.lsp.buf.declaration, { desc = "LSP: go to declaration" })
km.set("n", "<leader>ld", function()
  Snacks.picker.lsp_definitions()
end, { desc = "LSP: definitions" })
km.set("n", "<leader>li", function()
  Snacks.picker.lsp_implementations()
end, { desc = "LSP: implementations" })
km.set("n", "<leader>lt", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "LSP: type definitions" })
km.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: code actions" })
km.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "LSP: rename symbol" })
km.set("n", "<leader>le", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "LSP: buffer diagnostics" })
km.set("n", "<leader>lh", vim.diagnostic.goto_prev, { desc = "LSP: previous diagnostic" })
km.set("n", "<leader>ll", vim.diagnostic.goto_next, { desc = "LSP: next diagnostic" })
km.set("n", "<leader>lD", vim.lsp.buf.hover, { desc = "LSP: hover documentation" })

-- ============================================================================
-- UTILITY (leader-u prefix)
-- Note: LazyVim uses u for UI toggles, we add our utilities alongside
-- ============================================================================

-- Clear search highlights (LazyVim uses <Esc> but we keep explicit binding)
km.set("n", "<leader>uh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Source current file (useful for config development)
km.set("n", "<leader>us", "<cmd>so<CR>", { desc = "Source current file" })

-- LSP restart (uppercase L to avoid conflict with LazyVim's line numbers toggle)
km.set("n", "<leader>uL", "<cmd>LspRestart<CR>", { desc = "Restart LSP server" })

-- ============================================================================
-- FORMATTING (leader-m prefix for "make pretty")
-- ============================================================================

km.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format file or selection" })
