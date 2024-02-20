return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- require("nordic").load()
    vim.cmd.colorscheme("nordic")
  end,
}
