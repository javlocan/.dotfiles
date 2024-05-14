local awful = require 'awful'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local gears = require 'gears'

local taglist = require 'bar/widgets/taglist'
local clock = require 'bar/widgets/clock'
local tasklist = require 'bar/widgets/tasklist'
local tray = require 'bar/widgets/tray'

-- Keyboard map indicator and switcher
local layoutbox = awful.widget.layoutbox
local prompt = awful.widget.prompt { with_shell = true, prompt = 'Run: ' }
-- globalkeys = gears.table.join(globalkeys,
--
-- )

local bar = function(s)
  local wb = awful.wibar {
    position = 'top',
    height = 23,
    screen = s,
    bg = '#0000',
  }
  wb:setup {
    {
      {
        layout = wibox.layout.align.horizontal,
        {
          layout = wibox.layout.align.horizontal,
          layoutbox(s),
          taglist(s),
          awful.widget.prompt(),
        },
        nil,
        {
          layout = wibox.layout.align.horizontal,
          clock,
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
