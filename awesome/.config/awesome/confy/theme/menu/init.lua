local awful = require 'awful'
local beautiful = require 'beautiful'
local freedesktop = require 'freedesktop'

local c = require 'confy.configuration.const'

local M = {}

local myawesomemenu = {
  {
    'Hotkeys',
    function()
      require('awful.hotkeys_popup').show_help(nil, awful.screen.focused())
    end,
  },
  { 'Manual', string.format('%s -e man awesome', c.terminal) },
  { 'Edit config', string.format('%s -e %s %s', c.terminal, c.editor, awesome.conffile) },
  { 'Restart', awesome.restart },
  {
    'Quit',
    function()
      awesome.quit()
    end,
  },
}

M.set = function()
  awful.util.mymainmenu = freedesktop.menu.build {
    before = {
      { 'Awesome', myawesomemenu, beautiful.awesome_icon },
      -- other triads can be put here
    },
    after = {
      { 'Open terminal', c.misc.terminal },
      -- other triads can be put here
    },
  }
end

return M
