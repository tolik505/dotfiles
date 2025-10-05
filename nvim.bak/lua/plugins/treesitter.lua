return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
    { 'nushell/tree-sitter-nu', build = ':TSUpdate nu' },
  },
  config = function()
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          'go',
          'python',
          'templ',
          'lua',
          'javascript',
          'typescript',
          'vimdoc',
          'vim',
          'bash',
          'kdl',
          'markdown',
          'markdown_inline',
          'regex',
          'terraform',
          'dart',
          'gowork',
          'gosum',
          'gotmpl',
          'json',
          'comment',
        },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<M-space>',
            node_incremental = '<M-space>',
            scope_incremental = '<M-bs>',
            node_decremental = '<bs>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['ii'] = '@conditional.inner',
              ['ai'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = { ['<leader>b'] = '@parameter.inner' },
            swap_previous = {
              ['<leader>B'] = '@parameter.inner',
            },
          },
        },
        textsubjects = {
          enable = true,
          prev_selection = ',',
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
      }
    end, 0)
  end,
}
