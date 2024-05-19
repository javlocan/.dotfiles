local awful = require 'awful'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local gears = require 'gears'

local taglist = require 'confy/bar/widgets/taglist'
local clock = require 'confy/bar/widgets/clock'
local tasklist = require 'confy/bar/widgets/tasklist'
-- local tray = require 'bar/widgets/tray'

-- Keyboard map indicator and switcher
local layoutbox = awful.widget.layoutbox
local prompt = awful.widget.prompt { with_shell = true, prompt = 'Run: ' }
-- globalkeys = gears.table.join(globalkeys,
--
-- )

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
          layoutbox(s),
          taglist(s),
          s.promptbox,
        },
        nil,
        {
          layout = wibox.layout.align.horizontal,
          -- layoutbox(s),
          clock,
          s.tray,
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
