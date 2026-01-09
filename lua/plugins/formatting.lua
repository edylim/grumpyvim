-- Formatting configuration
-- Uses conform.nvim (LazyVim default)

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
      },
      -- Format on save
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    },
  },
}
