-- Gruvbox colorscheme configuration
-- Replaces LazyVim's default tokyonight with gruvbox dark

return {
  -- Add gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load before other plugins to ensure colors are available
    lazy = false, -- Don't lazy load the colorscheme
    opts = {
      terminal_colors = true, -- Enable terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- Invert background for search, diffs, statuslines and errors
      contrast = "", -- Can be "hard", "soft" or empty string for medium
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
  },

  -- Configure LazyVim to use gruvbox as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
