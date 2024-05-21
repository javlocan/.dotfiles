local start = require 'confy.configuration.start'
local keys = require 'confy.configuration.keys'
local buttons = require 'confy.configuration.buttons'

local M = {}

M.autostart = function()
  start:set_error_notification_handler()
  start:run_once()
end

M.keys = {
  client = keys.client,
  global = keys.global,
  keyboard = keys.keyboard,
}

M.buttons = {
  client = buttons.client,
  global = buttons.global,
  taglist = buttons.taglist,
  tasklist = buttons.tasklist,
}

return M
