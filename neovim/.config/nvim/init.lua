-- set leader key to space
vim.g.mapleader = " "

local lazy = require("lazy")
require("plugins.config.keymaps")
require("plugins.config.options")

lazy.setup({
	{ import = "plugins.config.common" },

	{ import = "plugins.theme" },
	{ import = "plugins.nav" },
	{ import = "plugins.text" },
	{ import = "plugins.code" },
	{ import = "plugins.code.lsp" },
	{ import = "plugins.git" },
	{ import = "plugins.extra" },
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
