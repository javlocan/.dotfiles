local keys = require 'confy.keys'

local M = {}

M.set_up = function(_, globalkeys, globalbuttons)
  globalkeys = keys.build_global_tag_navigation(globalkeys)
  root.keys = globalkeys
  root.buttons = globalbuttons
end

return M
