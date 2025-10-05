return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        layouts = {
          {
            elements = {
              -- {
              --   id = "stacks",
              --   size = 0.25
              -- },
              -- {
              --   id = "breakpoints",
              --   size = 0.25
              -- },
              {
                id = "scopes",
                size = 0.25,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              -- {
              --   id = 'console',
              --   size = 0.5,
              -- },
            },
            position = "bottom",
            size = 10,
          },
        },
      },
    },
    -- Installs the debug adapters for you
    "mason-org/mason.nvim",
    {
      "jay-babu/mason-nvim-dap.nvim",

      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          "delve",
          -- "python",
        },
      },
    },

    -- Add your own debuggers here
    {
      "leoluz/nvim-dap-go",
      opts = {
        delve = {
          build_flags = { "-tags=integration unit" },
        },
      },
    },
  },
}
