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
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
      local colorscheme_augroup = vim.api.nvim_create_augroup('colorscheme', { clear = true })

      local colorschemes = {}
      colorschemes['gruvbox-material'] = { 'rust', 'lua' }
      colorschemes['onedark'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json' }
      colorschemes['tokyonight'] = { 'html', 'htmldjango', 'css', 'scss' }

      local colorschemes = BUILD_COLORSCHEME_TABLE(colorschemes)

      vim.api.nvim_create_autocmd({
        -- 'FileType',
        'BufEnter',
        -- 'WinEnter',
      }, {
        group = colorscheme_augroup,
        callback = function()
          local colorscheme = vim.cmd.colorscheme
          local filetype = vim.bo.filetype

          for lang, cs in pairs(colorschemes) do
            if filetype == lang and colorscheme ~= cs then
              vim.cmd(string.format('colorscheme %s', cs))
            end
          end
        end,
      })
    end,
  },
}
