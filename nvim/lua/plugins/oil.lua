return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'
    oil.setup {
      default_file_explorer = true,
      delete_to_trash = true,
      columns = {
        'icon',
        -- 'permissions',
        -- 'size',
        -- 'mtime',
      },
    }
    -- Open file explorer on start up
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argv() == '.' then
          require('oil').open()
        end
      end,
    })
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
