return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufRead', 'BufNewFile' },
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  config = function()
    require('ibl').setup {
      exclude = {
        filetypes = {
          'lspinfo',
          'checkhealth',
          'help',
          'dashboard',
          '',
        },
      },
    }
  end,
}
