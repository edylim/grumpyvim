-- LSP Configuration
-- Extends LazyVim's LSP setup with grumpyvim's language servers
-- Note: typescript, python, go, tailwind, svelte are handled by LazyVim extras

return {
	-- Mason: ensure all required tools are installed
	-- We extend LazyVim's mason config, not replace it
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				-- Formatters
				"prettier",
				"stylua",
				-- LSP servers (supplement LazyVim extras)
				"graphql-language-service-cli",
			},
		},
	},

	-- LSP configuration overrides
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- Custom diagnostic signs (matching grumpyvim style)
			diagnostics = {
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			},
			-- Server-specific settings
			servers = {
				-- TypeScript: disable annoying suggestions
				-- Note: LazyVim uses ts_ls (previously tsserver)
				ts_ls = {
					init_options = {
						preferences = {
							disableSuggestions = true, -- Don't nag about code style
						},
					},
				},

				-- HTML: also handle templ files
				html = {
					filetypes = { "html", "templ" },
				},

				-- Templ: Go HTML templating
				templ = {
					filetypes = { "templ" },
				},

				-- GraphQL: extend to React/Svelte files
				graphql = {
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				},

				-- Stylelint LSP for CSS linting
				stylelint_lsp = {
					filetypes = { "css", "scss", "less", "sass" },
				},

				-- Lua: configure for Neovim development
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim", "Snacks" }, -- Recognize vim and Snacks globals
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
								checkThirdParty = false, -- Disable annoying prompts
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
			},
		},
	},
}
