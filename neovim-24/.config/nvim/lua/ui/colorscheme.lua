return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        style = 'night',
        styles = {
          comments = { italic = true },
        },
      }
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {
        italic_comments = true,
        underline_links = true,
      }
    end,
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
    'olimorris/onedarkpro.nvim',
    config = function()
      require('onedarkpro').setup {
        options = {
          -- transparency = true,
        },
      }
      local default = 'gruvbox-material'
      vim.cmd(string.format('colorscheme %s', default))

      local colorscheme_augroup = vim.api.nvim_create_augroup('colorscheme', { clear = true })

      local colorschemes = {}
      colorschemes['tokyonight'] = { 'lua' }
      colorschemes['gruvbox-material'] = { 'rust' }
      colorschemes['vscode'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json' }
      colorschemes['onedark'] = { 'html', 'htmldjango', 'css', 'scss' }

      local minicolors = UTILS.BUILD_MINICOLORS_TABLE(colorschemes)
      local colorschemes = UTILS.BUILD_COLORSCHEME_TABLE(colorschemes)

      vim.api.nvim_create_autocmd({
        -- 'FileType',
        'BufEnter',
        -- 'WinEnter',
      }, {
        group = colorscheme_augroup,
        callback = function()
          UTILS.CHECK_AND_SET_COLORSCHEME(colorschemes, minicolors, default)
        end,
      })
    end,
  },
}
