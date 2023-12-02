return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      theme = 'catppuccin',
    },
  },
  config = function()
    require('lualine').setup {
      -- Show icon in there are unsaved buffers
      sections = {
        lualine_z = {
          {
            function()
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_get_option(buf, 'modified') then
                  return '💾'           -- any message or icon
                end
              end
              return ''
            end,
          },
        },
      },
    }
  end
}
