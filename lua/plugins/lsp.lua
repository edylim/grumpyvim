-- LSP customizations
-- Language servers are handled by LazyVim extras (typescript, python, go, etc.)
-- Only add additional servers or override settings here

return {
  -- Mason: ensure additional tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "templ",
        "stylelint-lsp",
        -- Formatters
        "prettier",
        "stylua",
        "shfmt",
        "goimports",
        "gofumpt",
      },
    },
  },

  -- LSP server configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Custom diagnostic signs
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
      -- Server configurations
      servers = {
        -- TypeScript: configure vtsls
        vtsls = {
          root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json"),
          single_file_support = false,
          settings = {
            typescript = {
              suggest = { completeFunctionCalls = true },
            },
            vtsls = {
              autoUseWorkspaceTsdk = true,
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
                globals = { "vim", "Snacks" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
  },
}
