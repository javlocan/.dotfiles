--[[
        AWESOME WM CONFIGURATION?
            by javlocan.dev
--]]

pcall(require, 'luarocks.loader')
-- local awesome = awesome
-- local client = client

local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'
local awful = require 'awful'
require 'awful.autofocus'

local lain = require 'lain'
local freedesktop = require 'freedesktop'
local aw = require 'utils'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

dofile(aw.conf_dir .. '/error_handling.lua')

aw.run_once {
  'redshift -l 38:-5',
  'picom --no-frame-pacing --config ' .. aw.conf_dir .. '/picom.conf',
  'xclipd',
  'setxkbmap custom',
} -- comma-separated entries

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

local super = 'Mod4'

local terminal = 'alacritty'
local editor = os.getenv 'EDITOR' or 'nvim'

local vi_focus = false -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275

-- KEYS HAVE TO GO BEFORE RULES
dofile(aw.conf_dir .. '/keys.lua')
dofile(aw.conf_dir .. '/rules.lua')

awful.util.terminal = terminal
awful.util.tagnames = { '1', '2', '3', '4', '5' }
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

awful.util.taglist_buttons = mytable.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),
  awful.button({ super }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ super }, 3, function(t)
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

--

-- {{{ Menu

-- Create a launcher widget and a main menu
local myawesomemenu = {
  {
    'Hotkeys',
    function()
      require('awful.hotkeys_popup').show_help(nil, awful.screen.focused())
    end,
  },
  { 'Manual', string.format('%s -e man awesome', terminal) },
  { 'Edit config', string.format('%s -e %s %s', terminal, editor, awesome.conffile) },
  { 'Restart', awesome.restart },
  {
    'Quit',
    function()
      awesome.quit()
    end,
  },
}

awful.util.mymainmenu = freedesktop.menu.build {
  before = {
    { 'Awesome', myawesomemenu, beautiful.awesome_icon },
    -- other triads can be put here
  },
  after = {
    { 'Open terminal', terminal },
    -- other triads can be put here
  },
}

-- Hide the menu when the mouse leaves it
--[[
awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function()
    if not awful.util.mymainmenu.active_child or
       (awful.util.mymainmenu.wibox ~= mouse.current_wibox and
       awful.util.mymainmenu.active_child.wibox ~= mouse.current_wibox) then
        awful.util.mymainmenu:hide()
    else
        awful.util.mymainmenu.active_child.wibox:connect_signal("mouse::leave",
        function()
            if awful.util.mymainmenu.wibox ~= mouse.current_wibox then
                awful.util.mymainmenu:hide()
            end
        end)
    end
end)
--]]

-- Set the Menubar terminal for applications that require it
--menubar.utils.terminal = terminal

-- }}}

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)

-- }}}

-- {{{ Rules

-- Rules to apply to new clients (through the "manage" signal).

-- }}}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
  c.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 5)
  end

  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
  -- Custom
  if beautiful.titlebar_fun then
    beautiful.titlebar_fun(c)
    return
  end

  -- Default
  -- buttons for the titlebar
  local buttons = mytable.join(
    awful.button({}, 1, function()
      c:emit_signal('request::activate', 'titlebar', { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal('request::activate', 'titlebar', { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c, { size = 16 }):setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        align = 'center',
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal,
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal(),
    },
    layout = wibox.layout.align.horizontal,
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:emit_signal('request::activate', 'mouse_enter', { raise = vi_focus })
end)

client.connect_signal('focus', function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal('unfocus', function(c)
  c.border_color = beautiful.border_normal
end)

-- switch to parent after closing child window
local function backham()
  local s = awful.screen.focused()
  local c = awful.client.focus.history.get(s, 0)
  if c then
    client.focus = c
    c:raise()
  end
end

-- attach to minimized state
client.connect_signal('property::minimized', backham)
-- attach to closed state
client.connect_signal('unmanage', backham)
-- ensure there is always a selected client during tag switching or logins
tag.connect_signal('property::selected', backham)

-- Here, trying to replicate this
--
beautiful.init(aw.conf_dir .. '/theme.lua')
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
  beautiful.at_screen_connect(s)
end)

collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)
gears.timer {
  timeout = 60,
  autostart = true,
  call_now = true,
  callback = function()
    collectgarbage 'collect'
  end,
}
-- }}}
