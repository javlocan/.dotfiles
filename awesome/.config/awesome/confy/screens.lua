local awful = require 'awful'

local const = require 'confy.configuration.const'
local buttons = require 'confy.configuration.buttons'

local M = {}

M.set = function()
  awful.layout.layouts = const.layout_list -- sets layout
  awful.util.taglist_buttons = buttons.taglist
  awful.util.tasklist_buttons = buttons.tasklist
end

return M
