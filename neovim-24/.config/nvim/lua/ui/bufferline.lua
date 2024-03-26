return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          themable = false,
          middle_mouse_command = 'bdelete! %d',
          show_close_icon = false,
          show_buffer_icons = false,
          always_show_bufferline = false,
          diagnostics = 'nvim_lsp',
          diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
              s = s .. n .. sym
            end
            return s
          end,
        },
      }

      vim.keymap.set('n', '<C-q>', [[ <Cmd>bdelete!<CR> ]])
      vim.keymap.set('n', '<C-TAB>', [[ <Cmd>bnext<CR> ]])
      vim.keymap.set('n', '<C-S-TAB>', [[ <Cmd>bprevious<CR> ]])
    end,
  },
}
