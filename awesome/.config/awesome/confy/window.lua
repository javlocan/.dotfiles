local gears = require 'gears'
local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local M = {}

M.set_titlebars = function()
  client.connect_signal('request::titlebars', function(c)
    -- Custom
    if beautiful.titlebar_fun then
      beautiful.titlebar_fun(c)
      return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = mytable.join(
      awful.button({}, 1, function()
        c:emit_signal('request::activate', 'titlebar', { raise = true })
        awful.mouse.client.move(c)
      end),
      awful.button({}, 3, function()
        c:emit_signal('request::activate', 'titlebar', { raise = true })
        awful.mouse.client.resize(c)
      end)
    )

    awful.titlebar(c, { size = 16 }):setup {
      { -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout = wibox.layout.fixed.horizontal,
      },
      { -- Middle
        { -- Title
          align = 'center',
          widget = awful.titlebar.widget.titlewidget(c),
        },
        buttons = buttons,
        layout = wibox.layout.flex.horizontal,
      },
      { -- Right
        awful.titlebar.widget.floatingbutton(c),
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.stickybutton(c),
        awful.titlebar.widget.ontopbutton(c),
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal(),
      },
      layout = wibox.layout.align.horizontal,
    }
  end)
end

return M
