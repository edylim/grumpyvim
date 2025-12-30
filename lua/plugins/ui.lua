-- UI customizations
-- Extends LazyVim's UI plugins with grumpyvim preferences

return {
	-- Lualine statusline customization
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			-- Use gruvbox theme to match colorscheme
			opts.options = opts.options or {}
			opts.options.theme = "gruvbox"

			-- Add project name to left section (from original grumpyvim)
			-- LazyVim already has good defaults, we just tweak the theme
		end,
	},

	-- Bufferline customization
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				-- Use slanted separators like grumpyvim
				separator_style = "slope",
				-- Show tabs, not buffers (grumpyvim preference)
				mode = "tabs",
				-- Show neo-tree offset
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		},
	},

	-- Dashboard customization (snacks.dashboard in LazyVim)
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					-- Custom header with grumpyvim branding
					-- Uses ASCII art since the PNG can't be displayed in terminal
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
      ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀  
                                        LazyVim Edition
]],
					-- Quick action keys (uses Snacks.picker)
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
						{ icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC" },
						{
							icon = " ",
							key = "s",
							desc = "Restore Session",
							action = ":lua require('persistence').load()",
						},
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
		},
	},

	-- Which-key customization for grumpyvim key groups
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				-- Define key group labels for grumpyvim bindings
				{ "<leader>p", group = "project/files" },
				{ "<leader>l", group = "lsp" },
				{ "<leader>h", group = "harpoon" },
				{ "<leader>w", group = "windows" },
				{ "<leader>t", group = "tabs" },
				{ "<leader>m", group = "format" },
			},
		},
	},

	-- Web devicons: add GraphQL icon (from grumpyvim)
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
			},
		},
	},
}
