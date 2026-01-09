-- Editor plugin customizations
-- Only override what's necessary, use opts tables

return {
  -- Seamless navigation between Neovim and Kitty terminal panes
  {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
  },

  -- Inline color previews for CSS, hex, rgb, hsl
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      "css",
      "scss",
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
    },
  },

  -- Neo-tree customization
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- Harpoon2 customization
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
  },

  -- Remap neotest to <leader>T (if extra is enabled)
  {
    "nvim-neotest/neotest",
    optional = true,
    keys = {
      { "<leader>t", false },
      { "<leader>tt", false },
      { "<leader>tr", false },
      { "<leader>tl", false },
      { "<leader>ts", false },
      { "<leader>to", false },
      { "<leader>tO", false },
      { "<leader>tS", false },
      { "<leader>td", false },
      { "<leader>tD", false },
      { "<leader>tw", false },
      -- Remap to <leader>T
      { "<leader>T", "", desc = "+test" },
      { "<leader>Tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>TT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
      { "<leader>Tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>Tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>Ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>To", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<leader>TO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>TS", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>Td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
      { "<leader>Tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
    },
  },

  -- Which-key group labels
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>g", group = "git" },
        { "<leader>h", group = "harpoon" },
        { "<leader>l", group = "lsp" },
        { "<leader>m", group = "format" },
        { "<leader>p", group = "project" },
        { "<leader>t", group = "tabs" },
        { "<leader>T", group = "test" },
        { "<leader>u", group = "utility" },
        { "<leader>w", group = "windows" },
      },
    },
  },

  -- Web devicons: add GraphQL icon
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        gql = {
          icon = "",
          color = "#e535ab",
          cterm_color = "199",
          name = "GraphQL",
        },
        graphql = {
          icon = "",
          color = "#e535ab",
          cterm_color = "199",
          name = "GraphQL",
        },
      },
    },
  },
}
