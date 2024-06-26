local awful = require 'awful'
local wibox = require 'wibox'

local taglist = require 'confy/theme/bar/widgets/taglist'
local clock = require 'confy/theme/bar/widgets/clock'
local tasklist = require 'confy/theme/bar/widgets/tasklist'
-- local tray = require 'bar/widgets/tray'

-- Keyboard map indicator and switcher
local layoutbox = awful.widget.layoutbox

local bar = function(_, s)
  local wb = awful.wibar {
    position = 'top',
    height = 23,
    screen = s,
    bg = '#0000',
  }

  s.promptbox = awful.widget.prompt()

  s.tray = wibox.widget.systray()
  s.tray:set_screen(screen[screen.count()])

  wb:setup {
    {
      {
        layout = wibox.layout.align.horizontal,
        {
          layout = wibox.layout.align.horizontal,
          s.tray,
          taglist(s),
          s.promptbox,
        },
        nil,
        {
          layout = wibox.layout.align.horizontal,
          clock,
          layoutbox(s),
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

-- return bar
return { set = bar }
