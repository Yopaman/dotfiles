-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.6
  vim.opt.guifont = { "JetBrainsMono Nerd Font:h12", "b", "i" }
end

vim.g.md_pdf_viewer = "zathura"
vim.g.md_args = "--defaults /home/pablo/.config/pandoc/dracula.yaml"

vim.opt.spell = false
