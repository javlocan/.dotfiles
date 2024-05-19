local gears = require 'gears'
local awful = require 'awful'

require 'awful.hotkeys_popup.keys'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local const = require 'confy.configuration.const'
local keys = require 'confy.configuration.keys'

local k = const.keys

local super = k.super

local M = {}

local build_global_tag_navigation = function(tbl)
  for i = 1, 9 do
    tbl = mytable.join(
      tbl,
      -- View tag only.
      awful.key({ super }, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end, { description = 'view tag #' .. i, group = 'tag' }),
      -- Toggle tag display.
      awful.key({ super, 'Control' }, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end, { description = 'toggle tag #' .. i, group = 'tag' }),
      -- Move client to tag.
      awful.key({ super, 'Shift' }, '#' .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
      -- Toggle tag on focused client.
      awful.key({ super, 'Control', 'Shift' }, '#' .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end, { description = 'toggle focused client on tag #' .. i, group = 'tag' })
    )
  end
  return tbl
end

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
