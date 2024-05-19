local awful = require 'awful'
local wibox = require 'wibox'

local taglist = require 'confy/theme/bar/widgets/taglist'
local clock = require 'confy/theme/bar/widgets/clock'
local tasklist = require 'confy/theme/bar/widgets/tasklist'

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

return bar
