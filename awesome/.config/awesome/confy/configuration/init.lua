local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'

local const = require 'confy.configuration.const'
local start = require 'confy.configuration.start'
local keys = require 'confy.configuration.keys'
local rules = require 'confy.configuration.rules'

local M = {}

M.autostart = function()
  start:handle_awesome_errors()
  start:run_once()
  -- TODO: Maybe this set_whatev can be whatev:set instead
  -- they are not really starting things.
  -- They should be run in another funcion(s)
  start:set_taglist()
  start:set_tasklist()
  -- start:set_theme()
  --
end

M.set_keys = keys.set
M.set_rules = rules.set

M.set_theme = function()
  require 'awful.autofocus'
  awful.util.terminal = const.misc.terminal
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  -- beautiful.init(c.misc.theme_dir .. '/init.lua')
  beautiful.init(const.misc.conf_dir .. '/confy/theme/theme.lua')
  -- beautiful.init '/home/javlocan/.config/awesome/theme.lua'

  awful.screen.connect_for_each_screen(function(s)
    beautiful.at_screen_connect(s)
  end)
end

M.set_signals = function()
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

return M
