-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
    {
      'theHamsta/nvim-dap-virtual-text',
      config = function()
        require('nvim-dap-virtual-text').setup()
      end,
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    vim.fn.sign_define('DapBreakpoint', {
      text = ' ',
      texthl = 'DapBreakpoint',
      linehl = 'DapBreakpoint',
      numhl = 'DapBreakpoint',
    })

    vim.fn.sign_define('DapStopped', {
      text = '󰁕 ',
      texthl = 'DapStopped',
      linehl = 'DapStopped',
      numhl = 'DapStopped',
    })

    require('mason-nvim-dap').setup {
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
        'delve',
        'python',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
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
              id = 'scopes',
              size = 0.25,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            -- {
            --   id = 'console',
            --   size = 0.5,
            -- },
          },
          position = 'bottom',
          size = 10,
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        build_flags = { '-tags=integration' },
      },
    }
    require('dap-python').setup 'uv'

    -- dap.adapters['pwa-node'] = {
    --   type = 'server',
    --   host = 'localhost',
    --   port = '${port}',
    --   executable = {
    --     command = 'node',
    --     -- 💀 Make sure to update this path to point to your installation
    --     args = {
    --       require('mason-registry').get_package('js-debug-adapter'):get_install_path() .. '/js-debug/src/dapDebugServer.js',
    --       '${port}',
    --     },
    --   },
    -- }

    for _, language in ipairs { 'typescript', 'javascript' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
      }
    end

    dap.configurations.php = {
      {
        log = true,
        type = 'php',
        request = 'launch',
        name = 'Listen for XDebug',
        port = 9003,
        stopOnEntry = false,
        xdebugSettings = {
          max_children = 512,
          max_data = 1024,
          max_depth = 4,
        },
        breakpoints = {
          exception = {
            Notice = false,
            Warning = false,
            Error = false,
            Exception = false,
            ['*'] = false,
          },
        },
      },
    }
  end,
}
