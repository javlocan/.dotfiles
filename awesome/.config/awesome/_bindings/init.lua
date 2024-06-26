local _M = {}

local gears = require 'gears'
local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'

_M.clientkeys = gears.table.join(
  awful.key({ MOD }, 'f', function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = 'toggle fullscreen', group = 'client' }),
  awful.key({ MOD }, 'q', function(c)
    c:kill()
  end, { description = 'close', group = 'client' }),
  awful.key({ MOD, 'Control' }, 'space', awful.client.floating.toggle, { description = 'toggle floating', group = 'client' }),
  awful.key({ MOD, 'Control' }, 'Return', function(c)
    c:swap(awful.client.getmaster())
  end, { description = 'move to master', group = 'client' }),
  -- awful.key({ MOD }, "o", function(c)
  -- 	c:move_to_screen()
  -- end, { description = "move to screen", group = "client" }),
  -- awful.key({ MOD }, "t", function(c)
  -- 	c.ontop = not c.ontop
  -- end, { description = "toggle keep on top", group = "client" }),
  -- awful.key({ MOD }, "n", function(c)
  -- 	-- The client currently has the input focus, so it cannot be
  -- 	-- minimized, since minimized clients can't have the focus.
  -- 	c.minimized = true
  -- end, { description = "minimize", group = "client" }),
  awful.key({ MOD }, 'm', function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = '(un)maximize', group = 'client' })
)

_M.globalkeys = gears.table.join(
  awful.key({ MOD }, 'h', function()
    awful.client.focus.bydirection 'left'
    if client.focus then
      client.focus:raise()
    end
  end),
  awful.key({ MOD }, 'j', function()
    awful.client.focus.bydirection 'down'
    if client.focus then
      client.focus:raise()
    end
  end),
  awful.key({ MOD }, 'k', function()
    awful.client.focus.bydirection 'up'
    if client.focus then
      client.focus:raise()
    end
  end),
  awful.key({ MOD }, 'l', function()
    awful.client.focus.bydirection 'right'
    if client.focus then
      client.focus:raise()
    end
  end),
  awful.key({ MOD }, 'd', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),
  awful.key({ MOD }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),
  -- awful.key({ MOD }, UP, awful.tag.viewprev, { description = "view previous", group = "tag" }),
  -- awful.key({ MOD }, DOWN, awful.tag.viewnext, { description = "view next", group = "tag" }),
  awful.key({ MOD }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),

  -- awful.key({ MOD }, "h", function()
  -- 	awful.client.focus.byidx(1)
  -- end, { description = "focus next by index", group = "client" }),
  -- awful.key({ MOD }, "l", function()
  -- 	awful.client.focus.byidx(-1)
  -- end, { description = "focus previous by index", group = "client" }),
  awful.key({ MOD }, 'w', function()
    mymainmenu:show()
  end, { description = 'show main menu', group = 'awesome' }),

  -- Layout manipulation
  awful.key({ MOD, 'Shift' }, 'j', function()
    awful.client.swap.byidx(1)
  end, { description = 'swap with next client by index', group = 'client' }),
  awful.key({ MOD, 'Shift' }, 'k', function()
    awful.client.swap.byidx(-1)
  end, { description = 'swap with previous client by index', group = 'client' }),
  awful.key({ MOD, 'Control' }, 'j', function()
    awful.screen.focus_relative(1)
  end, { description = 'focus the next screen', group = 'screen' }),
  awful.key({ MOD, 'Control' }, 'k', function()
    awful.screen.focus_relative(-1)
  end, { description = 'focus the previous screen', group = 'screen' }),
  awful.key({ MOD }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),
  awful.key({ MOD }, 'Tab', function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'go back', group = 'client' }),

  -- Standard program
  awful.key({ MOD }, 'o', function()
    awful.spawn(BROWSER)
  end, { description = 'open a browser', group = 'launcher' }),
  awful.key({ MOD }, 'Return', function()
    awful.spawn(TERMINAL)
  end, { description = 'open a terminal', group = 'launcher' }),
  awful.key({ MOD, SHFT }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  awful.key({ MOD, SHFT }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

  -- awful.key({ MOD }, "l", function()
  -- 	awful.tag.incmwfact(0.05)
  -- end, { description = "increase master width factor", group = "layout" }),
  -- awful.key({ MOD }, "h", function()
  -- 	awful.tag.incmwfact(-0.05)
  -- end, { description = "decrease master width factor", group = "layout" }),
  awful.key({ MOD, 'Shift' }, 'h', function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),
  awful.key({ MOD, 'Shift' }, 'l', function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),
  awful.key({ MOD, 'Control' }, 'h', function()
    awful.tag.incncol(1, nil, true)
  end, { description = 'increase the number of columns', group = 'layout' }),
  awful.key({ MOD, 'Control' }, 'l', function()
    awful.tag.incncol(-1, nil, true)
  end, { description = 'decrease the number of columns', group = 'layout' }),
  awful.key({ MOD }, 'space', function()
    awful.layout.inc(1)
  end, { description = 'select next', group = 'layout' }),
  awful.key({ MOD, 'Shift' }, 'space', function()
    awful.layout.inc(-1)
  end, { description = 'select previous', group = 'layout' }),

  awful.key({ MOD, 'Control' }, 'n', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal('request::activate', 'key.unminimize', { raise = true })
    end
  end, { description = 'restore minimized', group = 'client' }),

  -- Prompt
  awful.key({ MOD }, 'r', function()
    awful.screen.focused().mypromptbox:run()
  end, { description = 'run prompt', group = 'launcher' }),

  awful.key({ MOD }, 'x', function()
    awful.prompt.run {
      prompt = 'Run Lua code: ',
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval',
    }
  end, { description = 'lua execute prompt', group = 'awesome' }),
  -- Menubar
  awful.key({ MOD }, 'p', function()
    menubar.show()
  end, { description = 'show the menubar', group = 'launcher' })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  _M.globalkeys = gears.table.join(
    _M.globalkeys,
    -- View tag only.
    awful.key({ MOD }, '#' .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = 'view tag #' .. i, group = 'tag' }),
    -- Toggle tag display.
    awful.key({ MOD, 'Control' }, '#' .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = 'toggle tag #' .. i, group = 'tag' }),
    -- Move client to tag.
    awful.key({ MOD, 'Shift' }, '#' .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
    -- Toggle tag on focused client.
    awful.key({ MOD, 'Control', 'Shift' }, '#' .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = 'toggle focused client on tag #' .. i, group = 'tag' })
  )
end

return _M
