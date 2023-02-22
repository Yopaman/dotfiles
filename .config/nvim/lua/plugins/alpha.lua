return {
  "goolord/alpha-nvim",
  opts = function(_, dashboard)
    table.insert(
      dashboard.section.buttons.val,
      dashboard.button("p", "󰐯 " .. "Recent projects", ":Telescope projects <CR>")
    )
  end,
}
