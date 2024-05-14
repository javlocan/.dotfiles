local awful = require 'awful'
local wibox = require 'wibox'

local taglist = require 'bar/widgets/taglist'
local clock = require 'bar/widgets/clock'
local tasklist = require 'bar/widgets/tasklist'
-- local tray = require 'bar/widgets/tray'

require('beautiful').systray_icon_spacing = 4
local tray = wibox.widget.systray()

-- Keyboard map indicator and switcher
local layoutbox = awful.widget.layoutbox

local bar = function(s)
  local wb = awful.wibar {
    position = 'top',
    height = 23,
    screen = s,
    bg = '#0000',
  }
  s.promptbox = awful.widget.prompt()
  wb:setup {
    {
      {
        layout = wibox.layout.align.horizontal,
        {
          layout = wibox.layout.align.horizontal,
          taglist(s),
          s.promptbox,
        },
        nil,
        {
          layout = wibox.layout.align.horizontal,
          clock,
          layoutbox(s),
          tray,
        },
      },
      {
        tasklist(s),
        valign = 'center',
        halign = 'center',
        layout = wibox.container.place,
      },
      layout = wibox.layout.stack,
    },
    left = 10,
    right = 10,
    top = 5,
    widget = wibox.container.margin,
  }
end

return bar
