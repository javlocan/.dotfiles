local BUILD_COLORSCHEME_TABLE = function(colorschemes)
  local result = {}
  for cs, fts in pairs(colorschemes) do
    for i, ft in pairs(fts) do
      result[ft] = cs
    end
  end
  return result
end

local SET_COLORSCHEME = function(cs)
  vim.cmd(string.format('colorscheme %s', cs))
end

local CHECK_AND_SET_COLORSCHEME = function(colorschemes, default)
  local colorscheme = vim.cmd.colorscheme
  local filetype = vim.bo.filetype

  local not_in_list = true

  for lang, cs in pairs(colorschemes) do
    if filetype == lang and colorscheme ~= cs then
      not_in_list = false
      SET_COLORSCHEME(cs)
      break
    end
  end

  if not_in_list and colorscheme ~= default then
    print(filetype)
    SET_COLORSCHEME(default)
  end
end

UTILS = {
  BUILD_COLORSCHEME_TABLE = BUILD_COLORSCHEME_TABLE,
  SET_COLORSCHEME = SET_COLORSCHEME,
  CHECK_AND_SET_COLORSCHEME = CHECK_AND_SET_COLORSCHEME,
}

return UTILS
