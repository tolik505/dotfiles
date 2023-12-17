return {
  {
    'nvim-neotest/neotest',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-jest',
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
        adapters = {
          require 'neotest-go' {
            experimental = {
              test_table = true,
            },
            args = { '-count=1', '-timeout=60s' },
          },
          require 'neotest-jest' {
            jest_test_discovery = true,
            jestCommand = function()
              local file = vim.fn.expand '%:p'

              return 'node ' .. vim.fn.getcwd() .. '/node_modules/jest/bin/jest.js --runInBand --runTestsByPath ' .. file
            end,
            jestConfigFile = function()
              local file = vim.fn.expand '%:p'
              if string.find(file, 'e2e') then
                local config = string.match(file, '.*/libs/[^/]+') .. '/jest.e2e.config.ts'

                return config
              end

              return string.match(file, '.*/libs/[^/]+') .. '/jest.config.ts'
            end,
            env = { CI = true },
            cwd = vim.fn.getcwd(),
          },
        },
      }
    end,
  },
}
