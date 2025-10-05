return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    end

    require('flutter-tools').setup {
      lsp = {
        widget_guides = {
          enabled = true,
        },
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
        on_attach = on_attach,
        capabilities = capabilities, -- e.g. lsp_status capabilities
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = 'prompt',
          enableSnippets = true,
          updateImportsOnRename = true,
          enableSdkFormatter = true,
        },
      },
      debugger = {
        -- make these two params true to enable debug mode
        enabled = false,
        run_via_dap = false,
        register_configurations = function(_)
          require('dap').adapters.dart = {
            type = 'executable',
            command = vim.fn.stdpath 'data' .. '/mason/bin/dart-debug-adapter',
            args = { 'flutter' },
          }

          require('dap').configurations.dart = {
            {
              type = 'dart',
              request = 'launch',
              name = 'Launch flutter',
              dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
              flutterSdkPath = 'home/flutter',
              program = '${workspaceFolder}/lib/main.dart',
              cwd = '${workspaceFolder}',
            },
          }
          -- uncomment below line if you've launch.json file already in your vscode setup
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
    }
  end,
}
