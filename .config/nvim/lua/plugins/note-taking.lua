return {
  { "conornewton/vim-pandoc-markdown-preview" },
  {
    "jbyuki/nabla.nvim",
    lazy = true,
  },
  {
    "ekickx/clipboard-image.nvim",
    opts = {
      markdown = {
        img_dir = { "cours", "src", "img" },
        img_dir_txt = "img",
      },
    },
  },
  {
    "rafamadriz/friendly-snippets",
  },
  { "godlygeek/tabular" },
  { "lervag/vimtex" },
  { "vim-pandoc/vim-pandoc-syntax" },
  { "folke/zen-mode.nvim" },
}
