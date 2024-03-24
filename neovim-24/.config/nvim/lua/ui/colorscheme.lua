return {
  -- { -- Transparent plugin doesnt work well with colorscheme changes
  --   'xiyaowong/transparent.nvim',
  --   lazy = false,
  -- },
  {
    'folke/tokyonight.nvim',
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_enable_bold = '1'
      vim.g.gruvbox_material_enable_italic = '1'
      vim.g.gruvbox_material_sign_column_background = 'grey'
      -- vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_diagnostic_line_highlight = '1'
      vim.g.gruvbox_material_diagnostic_text_highlight = '1'
    end,
  },
  {
    -- Theme inspired by Atom
    -- 'navarasu/onedark.nvim',
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      local default = 'onedark'
      -- UTILS.SET_COLORSCHEME(default)
      vim.cmd(string.format('colorscheme %s', default))

      local colorscheme_augroup = vim.api.nvim_create_augroup('colorscheme', { clear = true })

      local colorschemes = {}
      colorschemes['gruvbox-material'] = { 'rust', 'lua' }
      colorschemes['onedark'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json' }
      colorschemes['tokyonight'] = { 'html', 'htmldjango', 'css', 'scss' }

      local colorschemes = UTILS.BUILD_COLORSCHEME_TABLE(colorschemes)

      vim.api.nvim_create_autocmd({
        -- 'FileType',
        'BufEnter',
        -- 'WinEnter',
      }, {
        group = colorscheme_augroup,
        callback = function()
          UTILS.CHECK_AND_SET_COLORSCHEME(colorschemes, default)
        end,
      })
    end,
  },
}
