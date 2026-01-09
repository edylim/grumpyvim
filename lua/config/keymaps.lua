-- Custom keymaps (additions to LazyVim defaults)
-- See: https://www.lazyvim.org/keymaps for LazyVim defaults

local map = vim.keymap.set
local del = vim.keymap.del

-- ============================================================================
-- UNBIND LAZYVIM DEFAULTS (to avoid conflicts)
-- ============================================================================

-- Unbind LazyVim's Ctrl+hjkl (we use vim-kitty-navigator instead)
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

-- Unbind LazyVim's <leader><tab>* tab menu (we use <leader><tab> for prev file)
del("n", "<leader><tab>l")
del("n", "<leader><tab>o")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- Unbind LazyVim's <leader>l for Lazy (we use it for LSP, Lazy moves to <leader>L)
del("n", "<leader>l")

-- ============================================================================
-- SHORTCUTS
-- ============================================================================

-- Escape insert mode with jj
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Toggle previous file
map("n", "<leader><tab>", "<C-^>", { desc = "Toggle previous file" })

-- Show all keymaps
map("n", "<leader>?", function()
  Snacks.picker.keymaps()
end, { desc = "Show keymaps" })

-- Lazy plugin manager (moved from <leader>l)
map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- ============================================================================
-- WINDOWS (<leader>w)
-- ============================================================================

-- Kitty terminal navigation
map("n", "<C-h>", "<cmd>KittyNavigateLeft<CR>", { silent = true, desc = "Navigate left" })
map("n", "<C-j>", "<cmd>KittyNavigateDown<CR>", { silent = true, desc = "Navigate down" })
map("n", "<C-k>", "<cmd>KittyNavigateUp<CR>", { silent = true, desc = "Navigate up" })
map("n", "<C-l>", "<cmd>KittyNavigateRight<CR>", { silent = true, desc = "Navigate right" })

-- Window splits
map("n", "<leader>w|", "<C-w>v", { desc = "Split right" })
map("n", "<leader>w-", "<C-w>s", { desc = "Split below" })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })

-- Session management
map("n", "<leader>ws", function()
  require("persistence").save()
end, { desc = "Save session" })
map("n", "<leader>wr", function()
  require("persistence").load()
end, { desc = "Restore session" })

-- ============================================================================
-- TABS (<leader>t)
-- ============================================================================

map("n", "<leader>t", "<cmd>tabs<CR>", { desc = "List tabs" })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Next tab" })
map("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Previous tab" })
map("n", "<leader>ts", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })

-- ============================================================================
-- PROJECT/FILES (<leader>p)
-- ============================================================================

-- Neo-tree
map("n", "<leader>pt", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>pc", "<cmd>Neotree close<CR>", { desc = "Close file tree" })

-- Project switching (changes cwd)
map("n", "<leader>pp", function()
  Snacks.picker.projects({
    confirm = function(picker, item)
      picker:close()
      if item then
        local path = item.file or item.text
        vim.fn.chdir(path)
        vim.notify("Switched to: " .. path, vim.log.levels.INFO)
      end
    end,
  })
end, { desc = "Switch project" })

-- Find file in project (auto-switches cwd to project root)
map("n", "<leader>pf", function()
  Snacks.picker.smart({
    confirm = function(picker, item)
      picker:close()
      if item then
        local path = item.file or item.text
        local root = vim.fs.root(path, { ".git" })
        if root then
          vim.fn.chdir(root)
        end
        vim.cmd.edit(path)
      end
    end,
  })
end, { desc = "Find file" })

-- Grep/search
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep project" })
map("n", "<leader>pw", function()
  Snacks.picker.grep_word()
end, { desc = "Grep word under cursor" })
map("n", "<leader>pb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

-- ============================================================================
-- HARPOON (<leader>h)
-- ============================================================================

map("n", "<leader>ha", function()
  require("harpoon"):list():add()
end, { desc = "Harpoon: add file" })

map("n", "<leader>hs", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: show menu" })

map("n", "<leader>hl", function()
  require("harpoon"):list():next()
end, { desc = "Harpoon: next" })

map("n", "<leader>hh", function()
  require("harpoon"):list():prev()
end, { desc = "Harpoon: prev" })

map("n", "<leader>h1", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon: file 1" })
map("n", "<leader>h2", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon: file 2" })
map("n", "<leader>h3", function()
  require("harpoon"):list():select(3)
end, { desc = "Harpoon: file 3" })
map("n", "<leader>h4", function()
  require("harpoon"):list():select(4)
end, { desc = "Harpoon: file 4" })

-- ============================================================================
-- LSP (<leader>l)
-- ============================================================================

map("n", "<leader>lr", function()
  Snacks.picker.lsp_references()
end, { desc = "LSP: references" })
map("n", "<leader>lg", vim.lsp.buf.declaration, { desc = "LSP: declaration" })
map("n", "<leader>ld", function()
  Snacks.picker.lsp_definitions()
end, { desc = "LSP: definitions" })
map("n", "<leader>li", function()
  Snacks.picker.lsp_implementations()
end, { desc = "LSP: implementations" })
map("n", "<leader>lt", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "LSP: type definitions" })
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: code actions" })
map("n", "<leader>lR", vim.lsp.buf.rename, { desc = "LSP: rename" })
map("n", "<leader>le", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "LSP: diagnostics" })
map("n", "<leader>lh", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "LSP: prev diagnostic" })
map("n", "<leader>ll", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "LSP: next diagnostic" })
map("n", "<leader>lD", vim.lsp.buf.hover, { desc = "LSP: hover docs" })

-- ============================================================================
-- UTILITY (<leader>u)
-- ============================================================================

map("n", "<leader>uh", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })
map("n", "<leader>us", "<cmd>source %<CR>", { desc = "Source file" })
map("n", "<leader>uL", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- ============================================================================
-- FORMAT (<leader>m for "make pretty")
-- ============================================================================

map({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format" })
