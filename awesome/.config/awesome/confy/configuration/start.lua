local awful = require 'awful'
local naughty = require 'naughty'
local beautiful = require 'beautiful'

local c = require 'confy.configuration.const'

local M = {}

M.set_error_notification_handler = function()
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

local mytable = c.misc.mytable

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

return M
