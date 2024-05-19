local awful = require 'awful'

local const = require 'confy.configuration.const'

return {
  set = function()
    awful.layout.layouts = const.layout_list
  end,
}
