local gears = require 'gears'
local awful = require 'awful'
local beautiful = require 'beautiful'

local lain = require 'lain'
local freedesktop = require 'freedesktop'

local config = require 'config'
local c = config.const
local k = config.keys

local M = {}

M.set_layout = function()
  awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    lain.layout.centerwork,
    -- lain.layout.centerwork.horizontal,
    lain.layout.termfair,
    -- lain.layout.termfair.center,
  }

  -- awful.layout.suit.tile.left
  lain.layout.termfair.nmaster = 3
  lain.layout.termfair.ncol = 1
  lain.layout.termfair.center.nmaster = 3
  lain.layout.termfair.center.ncol = 1
end

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

M.set_taglist = function()
  awful.util.taglist_buttons = mytable.join(
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
    end)
  )
end

M.set_tasklist = function()
  awful.util.tasklist_buttons = mytable.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal('request::activate', 'tasklist', { raise = true })
      end
    end),
    awful.button({}, 3, function()
      awful.menu.client_list { theme = { width = 250 } }
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end)
  )
end

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

M.set_menu = function()
  awful.util.mymainmenu = freedesktop.menu.build {
    before = {
      { 'Awesome', myawesomemenu, beautiful.awesome_icon },
      -- other triads can be put here
    },
    after = {
      { 'Open terminal', c.terminal },
      -- other triads can be put here
    },
  }
end

return M
