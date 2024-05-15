local awful = require 'awful'

local M = {}

M.run_once = function(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

M.conf_dir = os.getenv 'HOME' .. '/.config/awesome'

return M
