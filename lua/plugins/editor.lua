-- Editor plugins
-- Additional editor functionality not included in LazyVim by default

return {
  -- Kitty terminal navigator
  -- Enables seamless navigation between Neovim and Kitty terminal splits
  -- Requires kitty.conf setup: see https://github.com/knubie/vim-kitty-navigator
  {
    "knubie/vim-kitty-navigator",
    lazy = false, -- Must load immediately for navigation to work
    init = function()
      -- Disable plugin's default mappings - we set them explicitly in keymaps.lua
      -- after deleting LazyVim's Ctrl+hjkl keymaps
      vim.g.kitty_navigator_no_mappings = 1
    end,
  },

  -- Color code highlighting
  -- Shows color previews inline for hex codes, rgb(), etc.
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Filetypes to enable colorizer on (* means all)
      "*",
      -- Exclusions
      "!lazy", -- Don't colorize lazy.nvim UI
    },
  },

  -- Project management integration with fzf-lua
  -- Allows switching between recent projects
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      -- Detection methods: look for .git, then other markers
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".root" },
      show_hidden = true, -- Show hidden files in telescope/fzf
      silent_chdir = true, -- Don't print message when changing directory
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      -- Register with fzf-lua for <leader>pp binding
      -- LazyVim's fzf-lua integration should pick this up automatically
    end,
  },

  -- Override neo-tree with grumpyvim preferences
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 40, -- Match grumpyvim's nvim-tree width
      },
      filesystem = {
        filtered_items = {
          visible = false, -- Hide filtered items
          hide_dotfiles = false, -- Show dotfiles
          hide_gitignored = false, -- Show git ignored files
          hide_by_name = {
            ".DS_Store",
            "Brewfile.lock.json",
            "lazy-lock.json",
          },
        },
        follow_current_file = {
          enabled = true, -- Auto-reveal current file
        },
        use_libuv_file_watcher = true, -- Use faster file watcher
      },
      default_component_configs = {
        indent = {
          with_markers = true, -- Show indent markers
          indent_marker = "│",
          last_indent_marker = "└",
        },
      },
    },
  },

  -- Harpoon2 configuration (extra is loaded in lazy.lua)
  -- Just customize the appearance here
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      settings = {
        save_on_toggle = true, -- Save marks when toggling menu
        sync_on_ui_close = true, -- Sync marks when closing UI
      },
    },
  },
}
