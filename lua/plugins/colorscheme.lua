-- Colorscheme configuration
-- Uses opts to extend, keeping upgrade-safe

return {
  -- Add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      italic = {
        strings = true,
        comments = true,
      },
    },
  },

  -- Tell LazyVim to use gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
