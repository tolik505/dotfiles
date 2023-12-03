return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  event = "VeryLazy",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  init = function()
    require("ibl").setup({
      -- other options
      exclude = { filetypes = { "dashboard" } },
    })
  end,
}
