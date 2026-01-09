-- Git plugin customizations

return {
  -- vim-fugitive for powerful git commands in vim buffers
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gvdiffsplit", "Gread", "Gwrite" },
    keys = {
      { "<leader>gG", "<cmd>Git<CR>", desc = "Git status (fugitive)" },
      { "<leader>gV", "<cmd>Gvdiffsplit<CR>", desc = "Git diff split" },
    },
  },
}
