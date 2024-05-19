local wibox = require 'wibox'
local beautiful = require 'beautiful'
local vpn = require 'confy/theme/bar/widgets/vpn'

local tray = wibox.widget {
  {
    {
      {
        vpn,
        layout = wibox.layout.align.horizontal,
      },
      widget = wibox.container.margin,
      left = 5,
      right = 5,
    },
    widget = wibox.container.background,
    bg = beautiful.bar_bg,
    shape = beautiful.bar_shape,
  },
  widget = wibox.container.margin,
  left = 4,
  right = 4,
}

return tray
