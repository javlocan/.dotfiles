local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'

local M = {}

M.const = {
  vi_focus = false, -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
  conf_dir = os.getenv 'HOME' .. '/.config/awesome',
  terminal = 'alacritty',
  editor = os.getenv 'EDITOR' or 'nvim',
}

M.keys = {
  super = 'Mod4',
  alt = 'Mod1',
  ctrl = 'Control',
  shift = 'Shift',
  left = 'h',
  down = 'j',
  up = 'k',
  right = 'l',
}

local C = M.const

M.layout_list = {}

M.autostart_cmd_list = {
  'redshift -l 38:-5',
  'picom --no-frame-pacing --config ' .. C.conf_dir .. '/picom.conf',
  'xclipd',
  'setxkbmap custom',
}

M.set_signals = function()
  -- Enable sloppy focus, so that focus follows mouse.
  client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', { raise = C.vi_focus })
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
end

return M
