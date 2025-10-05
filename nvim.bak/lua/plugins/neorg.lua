return {
  "nvim-neorg/neorg",
  cmd = 'Neorg',
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.journal"] = {
          config = {
            workspace = 'personal',
          }
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = 'nvim-cmp',
            name = '[Neorg]',
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/notes/work",
              personal = "~/notes/personal",
            },
            default_workspace = 'personal'
          },
        },
      },
    }
  end,
}
