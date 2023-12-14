return {
  'williamboman/mason.nvim',
  lazy = true,
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- import mason
    local mason = require 'mason'

    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'goimports',
        'gofumpt',
        'golines',
        'prettier',
        'js-debug-adapter',
        'delve',
        'stylua', -- lua formatter
        'eslint_d', -- js linter
      },
    }
  end,
}
