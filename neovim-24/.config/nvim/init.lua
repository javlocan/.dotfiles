require 'config.init'
require 'config.keymaps'
require 'config.utils'

require('lazy').setup({
  -- Import plugins by domain
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      -- require('mini.colors').setup {}

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  -- NOTE: 2. UI keymaps have detailed explanation on plugin configuration
  { import = 'ui.keymaps' },
  { import = 'ui.colorscheme' },
  -- { import = 'ui.indent_line' },
  { import = 'ui.git' },
  { import = 'ui.navigation' },
  -- { import = 'ui.bufferline' },

  -- NOTE: 1. Comment has basic instructions on initializing plugins
  { import = 'code.comment' },
  { import = 'code.treesitter' },
  { import = 'code.typing' },
  { import = 'code.formatting' },

  { import = 'code.lsp' },
  { import = 'code.cmp' },
  { import = 'code.dap' },
  { import = 'code.lint' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
