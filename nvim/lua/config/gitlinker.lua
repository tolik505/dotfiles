return {
  "ruifm/gitlinker.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufRead" },
  opts = {
    callbacks = {
      ["gitlab.time2go.tech"] = function(url_data)
        url_data.host = "git.time2go.tech"
        return require("gitlinker.hosts").get_gitlab_type_url(url_data)
      end,
      ["github.com"] = function(url_data)
        url_data.host = "github.com"
        return require("gitlinker.hosts").get_gitea_type_url(url_data)
      end,
    },
    mappings = nil,
  },
}
