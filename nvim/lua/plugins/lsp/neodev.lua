-- Additional lua configuration, makes nvim stuff amazing!
return {
  'folke/neodev.nvim',
  event = 'VeryLazy',
  opts = {
    library = { plugins = { 'nvim-dap-ui' }, types = true },
  },
}
