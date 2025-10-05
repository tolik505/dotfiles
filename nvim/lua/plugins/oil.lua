return {
  "stevearc/oil.nvim",
  -- config = function()
  --   -- Open file explorer on start up
  --   vim.api.nvim_create_autocmd("VimEnter", {
  --     callback = function()
  --       if vim.fn.argv() == "." then
  --         require("oil").open()
  --       end
  --     end,
  --   })
  -- end,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    columns = {
      "icon",
      -- 'permissions',
      -- 'size',
      -- 'mtime',
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
