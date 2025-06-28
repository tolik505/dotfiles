return {
  {
    'nvim-neotest/neotest',
    lazy = true,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'fredrikaverpil/neotest-golang', version = '*' },
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-python',
      'olimorris/neotest-phpunit',
      'mfussenegger/nvim-dap',
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)
      require('neotest').setup {
        icons = {
          expanded = '',
          child_prefix = '',
          child_indent = '',
          final_child_prefix = '',
          non_collapsible = '',
          collapsed = '',

          passed = '',
          running = '',
          failed = '',
          unknown = '',
        },
        adapters = {
          require 'neotest-golang' {
            testify_enabled = true,
            experimental = {
              test_table = true,
            },
            go_test_args = {
              '-v',
              '-tags=integration unit',
              -- '-race',
              '-coverprofile='
                .. vim.fn.getcwd()
                .. '/coverage.out',
            },
          },
          require 'neotest-python',
          -- require 'neotest-phpunit' {
          --   env = {
          --     XDEBUG_CONFIG = 'idekey=neotest',
          --   },
          --   dap = require('dap').configurations.php[1],
          -- },
          -- require 'neotest-jest' {
          --   jest_test_discovery = true,
          --   jestCommand = function()
          --     local file = vim.fn.expand '%:p'
          --
          --     return 'node ' .. vim.fn.getcwd() .. '/node_modules/jest/bin/jest.js --runInBand --runTestsByPath ' .. file
          --   end,
          --   jestConfigFile = function()
          --     local Path = require 'plenary.path'
          --
          --     function findClosestPath(filename, startFilePath)
          --       local startDir = Path:new(startFilePath):parent()
          --
          --       while startDir.filename ~= '/' do
          --         local filePath = Path:new(startDir.filename, filename)
          --
          --         if filePath:exists() then
          --           return filePath:absolute()
          --         end
          --
          --         startDir = startDir:parent()
          --       end
          --
          --       return nil
          --     end
          --
          --     local file = vim.fn.expand '%:p'
          --     if string.find(file, 'e2e') then
          --       return findClosestPath('jest-e2e.json', file)
          --     end
          --
          --     return findClosestPath('jest.config.ts', file)
          --   end,
          --   env = { CI = true },
          --   cwd = vim.fn.getcwd(),
          -- },
        },
      }
    end,
  },
}
