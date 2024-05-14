require 'config.error_handling'
local beautiful = require 'beautiful'
local gears = require 'gears'

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)
-- }}}

client.connect_signal('focus', function(c)
  c.border_color = beautiful.border_focus
  c.opacity = 1
end)
client.connect_signal('unfocus', function(c)
  c.border_color = beautiful.border_normal
  c.opacity = 0.9
end)

client.connect_signal('manage', function(c)
  c.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 6)
  end

  if not awesome.startup then
    awful.client.setslave(c)
  end

  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)
