-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  event = "VeryLazy",
  config = function()
    require('Comment').setup()
  end
}
