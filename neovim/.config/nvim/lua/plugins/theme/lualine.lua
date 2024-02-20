return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- local custom_onedark = require("lualine.themes.onedark")
    -- custom_onedark.normal.a.bg = "#41b0ba"
    -- custom_onedark.command.a.bg = "#eddb37"
    -- custom_onedark.insert.a.bg = "#3442b5"
    -- custom_onedark.normal.c.bg = "#222222"
    -- configure lualine with modified theme

    lualine.setup({
      options = {
        theme = "gruvbox-material",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
