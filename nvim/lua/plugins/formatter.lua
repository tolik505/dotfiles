return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.ERROR,
      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      command = "FormatWriteLock"
    })
  end
}
