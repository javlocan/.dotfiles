local start = require 'confy.configuration.start'

local M = {}

M.autostart = function()
  G = {}
  start:set_error_notification_handler()
  start:run_once()
  -- TODO: Maybe this set_whatev can be whatev:set instead
  -- they are not really starting things.
  -- They should be run in another funcion(s)
  start:set_taglist()
  -- start:set_tasklist()
end

local keys = require 'confy.keys'
local rules = require 'confy.rules'

-- awesome.connect = set_signals
M.set = {}
M.set.keys = function(self, new_keys)
  new_keys = keys.build_global_tag_navigation(new_keys)
  root.keys = new_keys
end

M.set.buttons = function(self, buttons)
  root.buttons = buttons
end

M.set.rules = rules.set

local keys = require 'confy.configuration.keys'

M.keys = {
  client = keys.client,
  global = keys.global,
}

M.buttons = {
  client = keys.clientbuttons,
  global = keys.globalbuttons,
}

return M
