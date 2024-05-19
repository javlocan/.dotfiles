local awful = require 'awful'
local naughty = require 'naughty'
local beautiful = require 'beautiful'

local c = require 'confy.configuration.const'

local M = {}

M.handle_awesome_errors = function()
  if awesome.startup_errors then
    naughty.notify {
      preset = naughty.config.presets.critical,
      title = 'Oops, there were errors during startup!',
      text = awesome.startup_errors,
    }
  end

  do
    local in_error = false

    awesome.connect_signal('debug::error', function(err)
      if in_error then
        return
      end

      in_error = true

      naughty.notify {
        preset = naughty.config.presets.critical,
        title = 'Oops, an error happened!',
        text = tostring(err),
      }

      in_error = false
    end)
  end
end

M.run_once = function()
  local cmd_arr = c.autostart_cmd_list
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

M.set_layout = function()
  awful.layout.layouts = c.layout_list
end

local mytable = c.misc.mytable
local k = c.keys

M.set_taglist = function()
  awful.util.taglist_buttons = mytable.join(
    awful.button({}, 1, function(t)
      t:view_only()
    end),
    awful.button({ k.super }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ k.super }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t)
      awful.tag.viewnext(t.screen)
    end),
    awful.button({}, 5, function(t)
      awful.tag.viewprev(t.screen)
    end)
  )
end

M.set_tasklist = function()
  awful.util.tasklist_buttons = mytable.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal('request::activate', 'tasklist', { raise = true })
      end
    end),
    awful.button({}, 3, function()
      awful.menu.client_list { theme = { width = 250 } }
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end)
  )
end

M.set_theme = function()
  require 'awful.autofocus'
  awful.util.terminal = c.misc.terminal
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  -- beautiful.init(c.misc.theme_dir .. '/init.lua')
  -- beautiful.init(c.misc.theme_dir .. '.lua')
  beautiful.init '/home/javlocan/.config/awesome/theme.lua'

  awful.screen.connect_for_each_screen(function(s)
    beautiful.at_screen_connect(s)
  end)
end

return M
