return {
  'andythigpen/nvim-coverage',
  ft = { 'go' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    -- https://github.com/andythigpen/nvim-coverage/blob/main/doc/nvim-coverage.txt
    auto_reload = true,
    lang = {
      go = {
        coverage_file = vim.fn.getcwd() .. '/coverage.out',
      },
    },
  },
}
