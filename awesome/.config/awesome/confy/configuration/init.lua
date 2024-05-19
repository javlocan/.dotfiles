local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'

local const = require 'confy.configuration.const'
local start = require 'confy.configuration.start'

local M = {}

M.autostart = function()
  start:handle_awesome_errors()
  start:run_once()
  -- TODO: Maybe this set_whatev can be whatev:set instead
  -- they are not really starting things.
  -- They should be run in another funcion(s)
  start:set_taglist()
  -- start:set_tasklist()
end

local set_signals = function()
  -- Enable sloppy focus, so that focus follows mouse.
  client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', { raise = const.misc.vi_focus })
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

  awesome.connect_signal('exit', function(reason_restart)
    if not reason_restart then
      return
    end

    local file = io.open('/tmp/awesomewm-last-selected-tags', 'w+')

    for s in screen do
      file:write(s.selected_tag.index, '\n')
    end

    file:close()
  end)

  -- local wallpaper = require 'confy.theme.wallpaper'
  -- screen.connect_signal('property::geometry', wallpaper:set)

  awesome.connect_signal('startup', function()
    local file = io.open('/tmp/awesomewm-last-selected-tags', 'r')
    if not file then
      return
    end

    local selected_tags = {}

    for line in file:lines() do
      table.insert(selected_tags, tonumber(line))
    end

    for s in screen do
      local i = selected_tags[s.index]
      local t = s.tags[i]
      t:view_only()
    end

    file:close()
  end)
end

M.set_signals = set_signals

local keys = require 'confy.keys'

M.extend_globals = function()
  -- awesome.connect = set_signals
  root.set = {}
  root.set.keys = function(self, new_keys)
    new_keys = keys.build_global_tag_navigation(new_keys)
    root.keys = new_keys
  end

  root.set.buttons = function(self, buttons)
    root.buttons(buttons)
  end
end

local keys = require 'confy.configuration.keys'

M.keys = {
  client = keys.client,
  global = keys.global,
}

M.buttons = {
  client = keys.clientbuttons,
  global = keys.globalbuttons,
}

return M
