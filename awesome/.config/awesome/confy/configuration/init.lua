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
---@param opts? start.options
---this function sets up notifications for startup errors and execs cmd autorun
M.autostart = function(_, opts)
  start:set_error_notification_handler()
  if opts and opts.autorun == false then
  else
    start:run_once()
  end
end

---@class buttons :buttonbindings
---@class keys :keybindings

---@class keybindings client and global keybindings and key definitions
---@field client keys client keybindings
---@field global keys global keybindings
---@field keyboard keys key definitions (mods,hjkl)

---@type keybindings client and global keybindings and key definitions
M.keys = {
  ---@type keys define client keys
  client = keys.client,
  ---@type keys define global keys
  global = keys.global,
  ---@type keys key definitions (mods,hjkl)
  keyboard = keys.keyboard,
}

---@class buttonbindings client and global mouse bindings
---@field client buttons client mouse bindings
---@field global buttons global mouse bindings
---@field taglist buttons taglist mouse bindings
---@field tasklist buttons tasklist mouse bindings

---@type buttonbindings client and global mouse bindings
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
