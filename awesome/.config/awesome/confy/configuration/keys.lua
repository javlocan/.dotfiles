local gears = require 'gears'
local awful = require 'awful'
require 'awful.hotkeys_popup.keys'
local hotkeys_popup = require 'awful.hotkeys_popup'

local beautiful = require 'beautiful'
local naughty = require 'naughty'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility
local cycle_prev = true -- cycle with only the previously focused client or all https://github.com/lcpz/awesome-copycats/issues/274

local lain = require 'lain'

local const = require 'confy.configuration.const'
local k = const.keys

local super = k.super
local alt = k.alt
local ctrl = k.ctrl
local shift = k.shift
local left = k.left
local down = k.down
local up = k.up
local right = k.right

local browser = const.misc.browser
local terminal = const.misc.terminal

local M = {}

M.clientbuttons = mytable.join(
  awful.button({}, 1, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
  end),
  awful.button({ super }, 1, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ super }, 3, function(c)
    c:emit_signal('request::activate', 'mouse_click', { raise = true })
    awful.mouse.client.resize(c)
  end)
)
M.client = mytable.join(
  awful.key({ alt, 'Shift' }, 'm', lain.util.magnify_client, { description = 'magnify client', group = 'client' }),
  awful.key({ super }, 'f', function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = 'toggle fullscreen', group = 'client' }),
  awful.key({ super }, 'q', function(c)
    c:kill()
  end, { description = 'close', group = 'client' }),
  awful.key({ super, 'Control' }, 'space', awful.client.floating.toggle, { description = 'toggle floating', group = 'client' }),
  awful.key({ super, 'Control' }, 'Return', function(c)
    c:swap(awful.client.getmaster())
  end, { description = 'move to master', group = 'client' }),
  awful.key({ super, 'Shift' }, 'o', function(c)
    c:move_to_screen()
  end, { description = 'move to screen', group = 'client' }),
  awful.key({ super }, 't', function(c)
    c.ontop = not c.ontop
  end, { description = 'toggle keep on top', group = 'client' }),
  awful.key({ super }, 'n', function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, { description = 'minimize', group = 'client' }),
  awful.key({ super }, 'm', function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = '(un)maximize', group = 'client' }),
  awful.key({ super, ctrl }, 'm', function(c)
    c.maximized_horizontally = not c.maximized_horizontally
    c:raise()
  end, { description = '(un)maximize', group = 'client' }),
  awful.key({ super, ctrl }, '%', function(c)
    c.maximized_vertically = not c.maximized_vertically
    c:raise()
  end, { description = '(un)maximize', group = 'client' })
)

M.global = mytable.join(
  -- Destroy all notifications
  awful.key({ 'Control' }, 'space', function()
    naughty.destroy_all_notifications()
  end, { description = 'destroy all notifications', group = 'hotkeys' }),
  -- Take a screenshot
  -- https://github.com/lcpz/dots/blob/master/bin/screenshot
  awful.key({ alt }, 'p', function()
    os.execute 'screenshot'
  end, { description = 'take a screenshot', group = 'hotkeys' }),

  -- X screen locker
  -- awful.key({ alt, "Control" }, "l", function()
  -- 	os.execute(scrlocker)
  -- end, { description = "lock screen", group = "hotkeys" }),

  -- Show help
  awful.key({ super }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),

  -- Tag browsing
  awful.key({ super }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
  awful.key({ super }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
  awful.key({ super }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),

  -- Non-empty tag browsing
  awful.key({ alt }, 'Left', function()
    lain.util.tag_view_nonempty(-1)
  end, { description = 'view  previous nonempty', group = 'tag' }),
  awful.key({ alt }, 'Right', function()
    lain.util.tag_view_nonempty(1)
  end, { description = 'view  previous nonempty', group = 'tag' }),

  -- Default client focus
  awful.key({ alt }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = 'client' }),
  awful.key({ alt }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = 'client' }),

  -- By-direction client focus
  awful.key({ super }, left, function()
    awful.client.focus.global_bydirection 'left'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus left', group = 'client' }),
  awful.key({ super }, down, function()
    awful.client.focus.global_bydirection 'down'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus down', group = 'client' }),
  awful.key({ super }, up, function()
    awful.client.focus.global_bydirection 'up'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus up', group = 'client' }),
  awful.key({ super }, right, function()
    awful.client.focus.global_bydirection 'right'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus right', group = 'client' }),

  -- By-direction client move
  -- awful.key({ super, shift }, left, function()
  -- 	awful.client.move.global_bydirection("left")
  -- 	if client.focus then
  -- 		client.focus:raise()
  -- 	end
  -- end, { description = "focus left", group = "client" }),
  -- Menu
  awful.key({ super }, 'w', function()
    awful.util.mymainmenu:show()
  end, { description = 'show main menu', group = 'awesome' }),

  -- Layout manipulation
  awful.key({ super, 'Shift' }, 'j', function()
    awful.client.swap.byidx(1)
  end, { description = 'swap with next client by index', group = 'client' }),
  awful.key({ super, 'Shift' }, 'k', function()
    awful.client.swap.byidx(-1)
  end, { description = 'swap with previous client by index', group = 'client' }),
  awful.key({ super, 'Control' }, 'j', function()
    awful.screen.focus_relative(1)
  end, { description = 'focus the next screen', group = 'screen' }),
  awful.key({ super, 'Control' }, 'k', function()
    awful.screen.focus_relative(-1)
  end, { description = 'focus the previous screen', group = 'screen' }),
  awful.key({ super }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),
  awful.key({ super }, 'Tab', function()
    if cycle_prev then
      awful.client.focus.history.previous()
    else
      awful.client.focus.byidx(-1)
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'cycle with previous/go back', group = 'client' }),

  -- Show/hide wibox
  awful.key({ super }, 'b', function()
    for s in screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      end
    end
  end, { description = 'toggle wibox', group = 'awesome' }),

  -- On-the-fly useless gaps change
  awful.key({ alt, 'Control' }, '+', function()
    lain.util.useless_gaps_resize(1)
  end, { description = 'increment useless gaps', group = 'tag' }),
  awful.key({ alt, 'Control' }, '-', function()
    lain.util.useless_gaps_resize(-1)
  end, { description = 'decrement useless gaps', group = 'tag' }),

  -- Dynamic tagging
  awful.key({ super, 'Shift' }, 'n', function()
    lain.util.add_tag()
  end, { description = 'add new tag', group = 'tag' }),
  -- awful.key({ super, "Shift" }, "r", function()
  -- 	lain.util.rename_tag()
  -- end, { description = "rename tag", group = "tag" }),
  awful.key({ super, 'Shift' }, 'Left', function()
    lain.util.move_tag(-1)
  end, { description = 'move tag to the left', group = 'tag' }),
  awful.key({ super, 'Shift' }, 'Right', function()
    lain.util.move_tag(1)
  end, { description = 'move tag to the right', group = 'tag' }),
  awful.key({ super, 'Shift' }, 'd', function()
    lain.util.delete_tag()
  end, { description = 'delete tag', group = 'tag' }),

  -- Standard program
  awful.key({ super }, 'Return', function()
    awful.spawn(terminal)
  end, { description = 'open a terminal', group = 'launcher' }),
  awful.key({ super, shift }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  awful.key({ super, shift }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

  awful.key({ super, alt }, 'l', function()
    awful.tag.incmwfact(0.05)
  end, { description = 'increase master width factor', group = 'layout' }),
  awful.key({ super, alt }, 'h', function()
    awful.tag.incmwfact(-0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),
  awful.key({ super, 'Shift' }, 'h', function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),
  awful.key({ super, 'Shift' }, 'l', function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),
  awful.key({ super, 'Control' }, 'h', function()
    awful.tag.incncol(1, nil, true)
  end, { description = 'increase the number of columns', group = 'layout' }),
  awful.key({ super, 'Control' }, 'l', function()
    awful.tag.incncol(-1, nil, true)
  end, { description = 'decrease the number of columns', group = 'layout' }),
  awful.key({ super }, 'space', function()
    awful.layout.inc(1)
  end, { description = 'select next', group = 'layout' }),
  awful.key({ super, 'Shift' }, 'space', function()
    awful.layout.inc(-1)
  end, { description = 'select previous', group = 'layout' }),

  awful.key({ super, 'Control' }, 'n', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal('request::activate', 'key.unminimize', { raise = true })
    end
  end, { description = 'restore minimized', group = 'client' }),

  -- Dropdown application
  awful.key({ super }, 'z', function()
    awful.screen.focused().quake:toggle()
  end, { description = 'dropdown application', group = 'launcher' }),

  -- Widgets popups
  awful.key({ alt }, 'c', function()
    if beautiful.cal then
      beautiful.cal.show(7)
    end
  end, { description = 'show calendar', group = 'widgets' }),
  awful.key({ alt }, 'h', function()
    if beautiful.fs then
      beautiful.fs.show(7)
    end
  end, { description = 'show filesystem', group = 'widgets' }),
  awful.key({ alt }, 'w', function()
    if beautiful.weather then
      beautiful.weather.show(7)
    end
  end, { description = 'show weather', group = 'widgets' }),

  -- Screen brightness
  awful.key({}, 'XF86MonBrightnessUp', function()
    os.execute 'xbacklight -inc 10'
  end, { description = '+10%', group = 'hotkeys' }),
  awful.key({}, 'XF86MonBrightnessDown', function()
    os.execute 'xbacklight -dec 10'
  end, { description = '-10%', group = 'hotkeys' }),

  -- ALSA volume control
  awful.key({ alt }, 'Up', function()
    os.execute(string.format('amixer -q set %s 1%%+', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume up', group = 'hotkeys' }),
  awful.key({ alt }, 'Down', function()
    os.execute(string.format('amixer -q set %s 1%%-', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume down', group = 'hotkeys' }),
  awful.key({ alt }, 'm', function()
    os.execute(string.format('amixer -q set %s toggle', beautiful.volume.togglechannel or beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'toggle mute', group = 'hotkeys' }),
  awful.key({ alt, 'Control' }, 'm', function()
    os.execute(string.format('amixer -q set %s 100%%', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume 100%', group = 'hotkeys' }),
  awful.key({ alt, 'Control' }, '0', function()
    os.execute(string.format('amixer -q set %s 0%%', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume 0%', group = 'hotkeys' }),

  -- MPD control
  awful.key({ alt, 'Control' }, 'Up', function()
    os.execute 'mpc toggle'
    beautiful.mpd.update()
  end, { description = 'mpc toggle', group = 'widgets' }),
  awful.key({ alt, 'Control' }, 'Down', function()
    os.execute 'mpc stop'
    beautiful.mpd.update()
  end, { description = 'mpc stop', group = 'widgets' }),
  awful.key({ alt, 'Control' }, 'Left', function()
    os.execute 'mpc prev'
    beautiful.mpd.update()
  end, { description = 'mpc prev', group = 'widgets' }),
  awful.key({ alt, 'Control' }, 'Right', function()
    os.execute 'mpc next'
    beautiful.mpd.update()
  end, { description = 'mpc next', group = 'widgets' }),
  awful.key({ alt }, '0', function()
    local common = { text = 'MPD widget ', position = 'top_middle', timeout = 2 }
    if beautiful.mpd.timer.started then
      beautiful.mpd.timer:stop()
      common.text = common.text .. lain.util.markup.bold 'OFF'
    else
      beautiful.mpd.timer:start()
      common.text = common.text .. lain.util.markup.bold 'ON'
    end
    naughty.notify(common)
  end, { description = 'mpc on/off', group = 'widgets' }),

  -- Copy primary to clipboard (terminals to gtk)
  awful.key({ super }, 'c', function()
    awful.spawn.with_shell 'xsel | xsel -i -b'
  end, { description = 'copy terminal to gtk', group = 'hotkeys' }),
  -- Copy clipboard to primary (gtk to terminals)
  awful.key({ super }, 'v', function()
    awful.spawn.with_shell 'xsel -b | xsel'
  end, { description = 'copy gtk to terminal', group = 'hotkeys' }),

  -- User programs
  awful.key({ super }, 'o', function()
    awful.spawn(browser)
  end, { description = 'run browser', group = 'launcher' }),

  -- Default
  --[[ Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    --]]
  -- [[ dmenu
  awful.key({ super }, 'd', function()
    os.execute(
      string.format(
        "dmenu_run -i -fn 'Monospace' -nb '%s' -nf '%s' -sb '%s' -sf '%s'",
        beautiful.bg_normal,
        beautiful.fg_normal,
        beautiful.bg_focus,
        beautiful.fg_focus
      )
    )
  end, { description = 'show dmenu', group = 'launcher' }),
  --]]
  -- alternatively use rofi, a dmenu-like application with more features
  -- check https://github.com/DaveDavenport/rofi for more details
  --[[ rofi
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("rofi -show %s -theme %s",
            'run', 'dmenu'))
        end,
        {description = "show rofi", group = "launcher"}),
    --]]
  -- Prompt
  awful.key({ super }, 'r', function()
    awful.screen.focused().mypromptbox:run()
  end, { description = 'run prompt', group = 'launcher' }),

  awful.key({ super }, 'x', function()
    awful.prompt.run {
      prompt = 'Run Lua code: ',
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval',
    }
  end, { description = 'lua execute prompt', group = 'awesome' })
  -- ]]
)

local build_global_tag_navigation = function()
  for i = 1, 9 do
    M.global = mytable.join(
      M.global,
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
end

M.set = function()
  -- {{{ Mouse bindings
  --
  clientbuttons = M.clientbuttons
  clientkeys = M.client
  globalkeys = M.global
  build_global_tag_navigation()

  root.buttons(mytable.join(
    awful.button({}, 3, function()
      awful.util.mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  ))

  root.keys(M.global)
end

return M
