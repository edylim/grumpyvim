-- Formatting configuration
-- Extends LazyVim's conform.nvim setup with grumpyvim's formatters

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- JavaScript/TypeScript ecosystem (prettier)
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },

        -- Web languages
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },

        -- Lua (stylua)
        lua = { "stylua" },
      },
      -- Format on save configuration
      format_on_save = {
        lsp_fallback = true, -- Use LSP if no formatter configured
        async = false, -- Synchronous for reliability
        timeout_ms = 3000, -- 3 second timeout
      },
    },
  },
}
