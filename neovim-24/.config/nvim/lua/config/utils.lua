BUILD_COLORSCHEME_TABLE = function(colorschemes)
  local result = {}
  for cs, fts in pairs(colorschemes) do
    for i, ft in pairs(fts) do
      result[ft] = cs
    end
  end
  return result
end
