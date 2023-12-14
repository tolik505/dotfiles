return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'catppuccin',
    },
  },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {
          {
            'buffers',
            symbols = {
              modified = ' 💾', -- Text to show when the buffer is modified

              alternate_file = '#', -- Text to show to identify the alternate file
              directory = '', -- Text to show when the buffer is a directory
            },
          }
        },
        lualine_c = {},
        lualine_x = {
          {
            function()
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_get_option(buf, 'modified') then
                  return '💾' -- any message or icon
                end
              end
              return ''
            end,
          },
          'encoding', 'fileformat', 'filetype',
        },
        lualine_z = {
          {
            'mode',
            -- fmt = function(str)
            --   return str:sub(1, 1)
            -- end
          },
        },
      },
    }
  end
}
