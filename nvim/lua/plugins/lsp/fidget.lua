-- LSP progress messages
-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
return {
  'j-hui/fidget.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  tag = 'legacy',
  opts = {},
}
