local start = require 'confy.configuration.start'
local keys = require 'confy.configuration.keys'
local buttons = require 'confy.configuration.buttons'

---@class confy
---@field autostart function
local M = {}

---@class _self just hate seeing the <_: any> thing and <self> is reserved

---@class start.options
---@field autorun? boolean autorun cmds set up in configuration.const (default:true)

---@param _ _self?
---@param opts? start.options this function sets up notifications for startup errors and execs cmd autorun
M.autostart = function(_, opts)
  start:set_error_notification_handler()
  if opts and opts.autorun == false then
  else
    start:run_once()
  end
end

---@class keys client and global keybindings and key definitions
---@field client table client keybindings
---@field global table global keybindings
---@field keyboard table key definitions (mods,hjkl)

---@type keys client and global keybindings and key definitions
M.keys = {
  ---@type keys define client keys
  client = keys.client,
  ---@type keys define global keys
  global = keys.global,
  ---@type keys key definitions (mods,hjkl)
  keyboard = keys.keyboard,
}

---@class buttons client and global mouse bindings
---@field client table client mouse bindings
---@field global table global mouse bindings
---@field taglist table taglist mouse bindings
---@field tasklist table tasklist mouse bindings

---@type buttons client and global mouse bindings
M.buttons = {
  ---@type buttons define client buttons
  client = buttons.client,
  ---@type buttons define global buttons
  global = buttons.global,
  ---@type buttons define tags buttons
  taglist = buttons.taglist,
  ---@type buttons define tasks buttons
  tasklist = buttons.tasklist,
}

return M
