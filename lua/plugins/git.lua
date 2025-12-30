-- Git plugins
-- Adds vim-fugitive for git commands (LazyVim only includes lazygit)

return {
  -- Vim-fugitive: Git commands in Neovim
  -- Provides :Git status, :Git blame, :Git diff, etc.
  -- LazyGit is great for complex operations, but fugitive is faster for quick commands
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gblame", "Gdiff", "Glog" },
    keys = {
      { "<leader>gs", "<cmd>Git status<CR>", desc = "Git status" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Git diff<CR>", desc = "Git diff" },
    },
  },
}
