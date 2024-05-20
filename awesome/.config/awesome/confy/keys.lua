local gears = require 'gears'
local awful = require 'awful'

require 'awful.hotkeys_popup.keys'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local const = require 'confy.configuration.const'
local keys = require 'confy.configuration.keys'

local k = const.keys

local super = k.super

local M = {}

M.set = function()
  -- {{{ Mouse bindings
  --
  clientbuttons = keys.clientbuttons
  clientkeys = keys.client
  -- keys.global = build_global_tag_navigation(keys.global)
  -- root.keys = keys.global
  --
  -- root.buttons(mytable.join(
  --   awful.button({}, 3, function()
  --     awful.util.mymainmenu:toggle()
  --   end),
  --   awful.button({}, 4, awful.tag.viewnext),
  --   awful.button({}, 5, awful.tag.viewprev)
  -- ))
end

M.build_global_tag_navigation = build_global_tag_navigation
M.global = keys.global
M.client = keys.client

return M
