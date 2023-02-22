return {
  {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      source_selector = {
        winbar = true,
        statusline = false,
      },
    },
  },
}
