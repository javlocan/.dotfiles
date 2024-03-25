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

      -- vim.keymap.set('n', '<C-q>', [[ command -count Bdel <Cmd>lua UTILS.bufferline.bdel(<count>)<CR> ]])
    end,
  },
}
