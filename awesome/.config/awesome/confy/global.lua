local awful = require 'awful'

local keys = require 'confy.keys'

local const = require 'confy.configuration.const'

local M = {}

M.set = function(_, globalkeys, globalbuttons)
  awful.util.terminal = const.misc.terminal

  globalkeys = keys.build_global_tag_navigation(globalkeys)
  root.keys = globalkeys
  root.buttons = globalbuttons
end

return M
