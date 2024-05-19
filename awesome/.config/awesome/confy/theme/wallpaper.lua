local beautiful = require 'beautiful'
local gears = require 'gears'

return {
  set = function(_, s)
    -- Wallpaper
    if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == 'function' then
        wallpaper = wallpaper(s)
      end
      gears.wallpaper.maximized(wallpaper, s, false)
    end
  end,
}
