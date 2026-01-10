-- UI plugin customizations

return {
  -- Lualine with gruvbox theme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "gruvbox",
      },
    },
  },

  -- Bufferline customization
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs", -- Show tabs, not buffers
        separator_style = "slant",
      },
    },
  },

  -- Noice: suppress install progress messages (not errors)
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = { event = "msg_show", find = "nvim%-treesitter/install" },
          opts = { skip = true },
        },
        {
          filter = { event = "msg_show", find = "Package is already installing" },
          opts = { skip = true },
        },
      },
    },
  },

  -- Snacks customization
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
      dashboard = {
        preset = {
          header = [[

       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠒⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⢀⣤⠀⠀⠀⠘⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠁⠀⠀⡇⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢸⣿⡇⠀⠀⠀⠀⠉⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⢀⡇⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠘⠻⣷⠀⠀⠀⠀⠀⠀⠈⠛⢦⣄⠀⠀⣀⣤⣶⣶⣶⣤⣤⣤⣤⣄⣀⣀⣀⡠⠔⠊⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⣀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⡞⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⡿⠛⠛⠋⠈⠉⠁⠘⡟⠀⠈⠉⠁⠈⠿⣿⣿⣆⠀⠀⢸⠇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⣷⣄⡄⠀⠀⠀⠀⠀⠉⠉⠀⠀⣾⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⢸⣿⣿⣿⣿⠏⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢀⣶⣿⣿⡿⠋⠁⠀⠀⠀⢰⣿⣷⠀⢠⡀⠀⠀⠀⠀⣿⣿⣷⣄⠀⠀⣀⣀⢀⣶⠀⠀⠈⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣧⣴⣿⣿⣿⣿⣷⡆⠀⠀⠀⠀⠈⠻⣿⣿⠟⠁⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⠙⠻⠛⠋⠀⠀⠀⡿⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠻⣿⣿⠿⢷⣄⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⣮⠀⣴⣿⣿⣦⣄⠀⠀⠀⢠⡇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⠟⢉⣤⣤⣬⡙⢿⣿⣿⣆⠀⣠⣿⣇⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠻⢿⣷⣶⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣆⣿⣿⢿⣿⣿⣿⣿⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀ ⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⣽⠿⠿⠟⢻⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⢯⢲⠈⢻⣿⡟⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣠⣴⣾⣿⠃⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀
       ⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
         █▀▀⣿█▀▄⣿█⣿█⣿█▄█⣿█▀█⣿█⣿█⣿⣿██╗⣿⣿⣿██╗██╗███╗⣿⣿⣿███╗
         █⢠█⣿█▀▄⣿█⣿█⣿█⣿█⣿█▀▀⣿⣿█⣿⣿⣿██║⣿⣿⣿██║██║████╗⣿████║
         ▀▀▀⣿▀⣿▀⣿▀▀▀⣿▀⣿▀⣿▀⣿⣿⣿⣿▀⣿⣿⣿██║⣿⣿⣿██║██║██╔████╔██║
         ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚██╗⣿██╔╝██║██║╚██╔╝██║
        ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚████╔╝ ██║██║⣿╚═╝⣿██║
       ⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿╚═══╝  ╚═╝╚═╝⣿⣿⣿⣿⣿╚═╝
      ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀
                                        LazyVim Edition
]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
