return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
        branch = "main", -- NOTE; not the master branch!
        build = function()
          vim.cmd(":TSUpdate go")
        end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*", -- Optional, but recommended; track releases
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
        end,
      },
      "mfussenegger/nvim-dap",
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          -- Here we can set options for neotest-golang, e.g.
          -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true, -- requires leoluz/nvim-dap-go
          testify_enabled = true,
          experimental = {
            test_table = true,
          },
          go_test_args = {
            "-v",
            "-tags=integration unit",
            -- '-race',
            "-coverprofile="
              .. vim.fn.getcwd()
              .. "/coverage.out",
            "-coverpkg=./...",
          },
          -- go_list_args = { '-tags=integration unit' },
          dap_go_opts = {
            delve = {
              build_flags = { "-tags=integration unit" },
            },
          },
        },
      },
    },
  },
}
