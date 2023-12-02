-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'David-Kunz/jester',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    vim.fn.sign_define('DapBreakpoint',
      { text = ' ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

    vim.fn.sign_define('DapStopped',
      {
        text = '󰁕 ',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
      })

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }


    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
    require("jester").setup({
      cmd = "node " ..
          vim.fn.getcwd() .. "/node_modules/jest/bin/jest.js - t '$result' -- $file", -- run command
      identifiers = { "test", "it" },                                                 -- used to identify tests
      prepend = { "describe" },                                                       -- prepend describe blocks
      expressions = { "call_expression" },                                            -- tree-sitter object used to scan for tests/describe blocks
      path_to_jest_run = './node_modules/.bin/jest',                                  -- used to run tests
      path_to_jest_debug = './node_modules/.bin/jest',                                -- used for debugging
      terminal_cmd = ":vsplit | terminal",
      dap = {
        type = "pwa-node",
        request = 'launch',
        cwd = vim.fn.getcwd(),
        runtimeArgs = { '--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file' },
        args = { '--no-cache' },
        sourceMaps = false,
        protocol = 'inspector',
        skipFiles = { '<node_internals>/**/*.js' },
        console = 'integratedTerminal',
        port = 9229,
        disableOptimisticBPs = true
      }
    })

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      }
    }

    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          -- trace = true, -- include debugger info
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
            "${file}",
          },
          sourceMaps = true,
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          port = 8123,
        },
      }
    end

    require("nvim-dap-virtual-text").setup()
  end,
}
