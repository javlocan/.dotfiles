return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          diagnostics = 'nvim_lsp',
          -- indicator = {
          --   style = 'underline',
          -- },
        },
      }

      vim.keymap.set('n', '<C-q>', [[ <Cmd>bdelete!<CR> ]])
      vim.keymap.set('n', '<C-TAB>', [[ <Cmd>bnext<CR> ]])
    end,
  },
}
