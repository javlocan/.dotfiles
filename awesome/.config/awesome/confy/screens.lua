local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

local const = require 'confy.configuration.const'
local buttons = require 'confy.configuration.buttons'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local M = {}

M.set = function()
  require 'awful.autofocus'

  awful.layout.layouts = const.layout_list -- sets layout

  awful.util.taglist_buttons = buttons.taglist
  awful.util.tasklist_buttons = buttons.tasklist
end

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
