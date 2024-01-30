-- set leader key to space
vim.g.mapleader = " "

require("config.lazy")
require("config.keymaps")
require("config.options")

require("lazy").setup({
  { import = "config.common" },

  { import = "theme" },
  { import = "nav" },
  { import = "text" },
  { import = "code" },
  { import = "code.lsp" },
  { import = "git" },
  { import = "extra" },
}, {
  install = {
    colorscheme = { "onedark" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
