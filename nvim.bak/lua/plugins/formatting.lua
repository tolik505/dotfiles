return {
  'stevearc/conform.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        go = { 'goimports', 'gofumpt' },
      },
      formatters = {
        golines = {
          args = { '-m', '120' },
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      },
    }
  end,
}
