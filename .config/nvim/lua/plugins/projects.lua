return {
  { "folke/persistence.nvim", enabled = false },
  {
    "ahmedkhalf/project.nvim",
    name = "project_nvim",
    opts = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("projects")
    end,
  },
}
