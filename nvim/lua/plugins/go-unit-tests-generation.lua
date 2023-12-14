return {
  'yanskun/gotests.nvim',
  cmd = 'GoTests',
  config = function()
    require("gotests").setup()
  end
}
