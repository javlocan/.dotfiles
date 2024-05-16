local awful = require 'awful'
local naughty = require 'naughty'
local config = require 'config'

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

M.__cmd_list = config.autostart_cmd_list

M.run_once = function(self)
  local cmd_arr = self.__cmd_list
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

return M
