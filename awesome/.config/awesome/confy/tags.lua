local awful = require 'awful'
local gears = require 'gears'

local const = require 'confy.configuration.const'

local k = require('confy.configuration.keys').keyboard
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local M = {}

local build_global_tag_navigation = function()
  local tbl = {}
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

awful.util.terminal = const.misc.terminal
M.bind_keys = function()
  local tag_navigation_key_bindings = build_global_tag_navigation()
  awful.keyboard.append_global_keybindings(tag_navigation_key_bindings)
end

M.bind_buttons = function()
  awful.keyboard.append_global_keybindings {
    awful.button({}, 1, function(t)
      t:view_only()
    end),
    awful.button({ k.super }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ k.super }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t)
      awful.tag.viewnext(t.screen)
    end),
    awful.button({}, 5, function(t)
      awful.tag.viewprev(t.screen)
    end),
  }
end

return M
