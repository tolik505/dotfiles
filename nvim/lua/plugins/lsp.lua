return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "gopls",
          "typescript-language-server",
          "eslint-lsp",
          "prettier",
          "js-debug-adapter",
        },
      },
    },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end
}
