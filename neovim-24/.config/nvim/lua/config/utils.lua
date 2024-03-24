local BUILD_COLORSCHEME_TABLE = function(colorschemes)
  local result = {}
  for cs, fts in pairs(colorschemes) do
    for _, ft in pairs(fts) do
      result[ft] = cs
    end
  end
  return result
end

local BUILD_MINICOLORS_TABLE = function(colorschemes)
  local MiniColors = require 'mini.colors'
  local result = {}
  for cs, _ in pairs(colorschemes) do
    local mini_cs = MiniColors.get_colorscheme(cs)
    result[cs] = mini_cs
  end
  return result
end

local SET_COLORSCHEME = function(cs)
  local animate = function()
    MiniColors.animate({ cs }, { transition_steps = 10, transition_duration = 120 })
  end
  vim.schedule(animate)
end

local CHECK_AND_SET_COLORSCHEME = function(colorschemes, minicolors, default)
  local colorscheme = vim.cmd 'colorscheme'
  local filetype = vim.bo.filetype

  local not_in_list = true

  if filetype ~= '' then
    for lang, cs in pairs(colorschemes) do
      if filetype == lang and colorscheme ~= cs then
        not_in_list = false
        SET_COLORSCHEME(minicolors[cs])
        break
      end
    end

    if not_in_list and colorscheme ~= default then
      SET_COLORSCHEME(minicolors[default])
    end
  end
end

UTILS = {
  BUILD_MINICOLORS_TABLE = BUILD_MINICOLORS_TABLE,
  BUILD_COLORSCHEME_TABLE = BUILD_COLORSCHEME_TABLE,
  SET_COLORSCHEME = SET_COLORSCHEME,
  CHECK_AND_SET_COLORSCHEME = CHECK_AND_SET_COLORSCHEME,
}

return UTILS
