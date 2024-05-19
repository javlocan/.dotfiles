local awful = require 'awful'
local beautiful = require 'beautiful'

local const = require 'confy.configuration.const'

local M = {}

M.set = function()
  require 'awful.autofocus'
  awful.util.terminal = const.misc.terminal
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  beautiful.init(const.misc.conf_dir .. '/confy/theme/theme.lua')

  awful.screen.connect_for_each_screen(function(s)
    beautiful.at_screen_connect(s)
  end)
end

return M
