local awful = require 'awful'
local naughty = require 'naughty'
local beautiful = require 'beautiful'

local config = require 'config'
local C = config.const

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
  local cmd_arr = config.autostart_cmd_list
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

M.set_theme = function()
  require 'awful.autofocus'
  awful.util.terminal = C.terminal
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  beautiful.init(C.conf_dir .. '/theme.lua')
  awful.screen.connect_for_each_screen(function(s)
    beautiful.at_screen_connect(s)
  end)
end

return M
