return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim',
      },
    },
    'hrsh7th/cmp-nvim-lsp',
    'b0o/schemastore.nvim',
    { 'antosha417/nvim-lsp-file-operations', opts = {} },
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    local servers = {
      gopls = {
        root_dir = { 'go.mod', '.git' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
      tsserver = {
        root_dir = { 'package.json', 'node_modules', '.git' },
      },
      eslint = {
        root_dir = { '.eslintrc.js' },
      },
      lua_ls = {
        root_dir = { '.git' },
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      jsonls = {
        init_options = {
          provideFormatter = false,
        },
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      },
      graphql = {
        filetypes = { 'graphql', 'gql' },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }

    -- used to enable autocompletion (assign to every lsp server config)
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
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
    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
          root_dir = function(filename)
            if servers[server_name].root_dir then
              return lspconfig.util.root_pattern(servers[server_name].root_dir)(filename)
            end
            return nil
          end,
        }
      end,
    }

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end,
}
