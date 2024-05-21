local awful = require 'awful'
local beautiful = require 'beautiful'

local keys = require 'confy.configuration.keys'
local buttons = require 'confy.configuration.buttons'

local M = {}

local set_rules = function(clientkeys, clientbuttons)
  -- {{{ Rules
  -- Rules to apply to new clients (through the "manage" signal).
  -- All clients will match this rule.
  awful.rules.rules = {
    {
      rule = {},
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        -- maximized = false,
        -- fullscreen = false,
        keys = clientkeys,
        buttons = clientbuttons,
        -- screen = awful.screen.preferred,
        screen = awful.screen.focused,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      },
    },

    -- Floating clients.
    {
      rule_any = {
        instance = {
          'DTA', -- Firefox addon DownThemAll.
          'copyq', -- Includes session name in class.
          'pinentry',
        },
        class = {
          'Arandr',
          'Blueman-manager',
          'Gpick',
          'Kruler',
          'MessageWin', -- kalarm.
          'Sxiv',
          'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
          'Wpa_gui',
          'veromix',
          'xtightvncviewer',
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          'Event Tester', -- xev.
        },
        role = {
          'AlarmWindow', -- Thunderbird's calendar.
          'ConfigManager', -- Thunderbird's about:config.
          'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
        },
      },
      properties = { floating = true },
    },

    -- Add titlebars to normal clients and dialogs
    -- { rule_any = { type = { 'normal', 'dialog' } }, properties = { titlebars_enabled = false } },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
  }
end

---@param _ _self
---@param args { keys: keys, buttons: buttons }
M.set = function(_, args)
  local clientkeys = args.keys or keys.client
  local clientbuttons = args.buttons or buttons.client
  set_rules(clientkeys, clientbuttons)
end

return M
