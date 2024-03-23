-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     -- 'folke/tokyonight.nvim',
--     'sainnhe/gruvbox-material',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     -- init = function()
--     --   -- Load the colorscheme here.
--     --   -- Like many other themes, this one has different styles, and you could load
--     --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     --   vim.cmd.colorscheme 'gruvbox-material'
--     --
--     --   -- You can configure highlights by doing something like:
--     --   vim.cmd.hi 'Comment gui=none'
--     -- end,
--     config = function()
--       vim.g.gruvbox_material_enable_bold = '1'
--       vim.g.gruvbox_material_enable_italic = '1'
--       vim.g.gruvbox_material_sign_column_background = 'grey'
--       -- vim.g.gruvbox_material_ui_contrast = "high"
--       vim.g.gruvbox_material_background = 'hard'
--       vim.g.gruvbox_material_diagnostic_line_highlight = '1'
--       vim.g.gruvbox_material_diagnostic_text_highlight = '1'
--       vim.cmd 'colorscheme gruvbox-material'
--     end,
--   },
-- }
return {
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

      vim.api.nvim_create_autocmd({
        -- 'FileType',
        'BufEnter',
        -- 'WinEnter',
      }, {
        group = colorscheme_augroup,
        callback = function()
          -- Change colorscheme by filetype
          local colorscheme = vim.cmd.colorscheme
          local filetype = vim.bo.filetype
          print(string.format('filetype: %s', filetype))
          for cs, fts in pairs(colorschemes) do
            for i, ft in pairs(fts) do
              if ft == filetype then
                if cs ~= colorscheme then
                  local colorscheme_cs = string.format('colorscheme %s', cs)
                  vim.cmd(colorscheme_cs)
                end
              end
            end
          end
        end,
      })
    end,
  },
}
