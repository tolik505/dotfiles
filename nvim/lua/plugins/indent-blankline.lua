return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufRead', 'BufNewFile' },
  -- See `:help ibl`
  main = 'ibl',
  config = function()
    require('ibl').setup {
      indent = {
        char = '▏',
      },
      exclude = {
        filetypes = {
          'lspinfo',
          'checkhealth',
          'help',
          'man',
          'dashboard',
          '',
        },
      },
    }
  end,
}
