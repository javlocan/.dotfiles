local awful = require 'awful'
local gears = require 'gears'

local const = require 'confy.configuration.const'
local keys = require 'confy.configuration.keys'
local buttons = require 'confy.configuration.buttons'

local k = keys.keyboard
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local M = {}

local build_global_tag_navigation = function(tbl)
  for i = 1, 9 do
    tbl = mytable.join(
      tbl,
      -- View tag only.
      awful.key({ k.super }, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end, { description = 'view tag #' .. i, group = 'tag' }),
      -- Toggle tag display.
      awful.key({ k.super, 'Control' }, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end, { description = 'toggle tag #' .. i, group = 'tag' }),
      -- Move client to tag.
      awful.key({ k.super, 'Shift' }, '#' .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
      -- Toggle tag on focused client.
      awful.key({ k.super, 'Control', 'Shift' }, '#' .. i + 9, function()
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

M.set = function(_, args)
  awful.util.terminal = const.misc.terminal

  local keys = args.keys or keys.global
  local buttons = args.buttons or buttons.global

  keys = build_global_tag_navigation(keys)

  root.keys = keys
  root.buttons = buttons
end

return M
