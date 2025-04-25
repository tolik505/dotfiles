return {
  '3rd/image.nvim',
  dependencies = { 'luarocks.nvim' },
  config = function()
    require('image').setup {
      backend = 'ueberzug',
      max_height_window_percentage = 100,
      hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.svg' },
    }
  end,
}
