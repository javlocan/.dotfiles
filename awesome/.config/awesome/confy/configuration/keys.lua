local naughty = require 'naughty'
local beautiful = require 'beautiful'
local gears = require 'gears'
local awful = require 'awful'

require 'awful.hotkeys_popup.keys'
local hotkeys_popup = require 'awful.hotkeys_popup'
local lain = require 'lain'

local const = require 'confy.configuration.const'

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local browser = const.misc.browser
local terminal = const.misc.terminal
local cycle_only_prev = true -- cycle with only the previously focused client or all

local M = {}

M.keyboard = {
  super = 'Mod4',
  alt = 'Mod1',
  ctrl = 'Control',
  shift = 'Shift',
  left = 'h',
  down = 'j',
  up = 'k',
  right = 'l',
}

local k = M.keyboard

M.client = mytable.join(
  awful.key({ k.alt, 'Shift' }, 'm', lain.util.magnify_client, { description = 'magnify client', group = 'client' }),
  awful.key({ k.super }, 'f', function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = 'toggle fullscreen', group = 'client' }),
  awful.key({ k.super }, 'q', function(c)
    c:kill()
  end, { description = 'close', group = 'client' }),
  awful.key({ k.super, 'Control' }, 'space', awful.client.floating.toggle, { description = 'toggle floating', group = 'client' }),
  awful.key({ k.super, 'Control' }, 'Return', function(c)
    c:swap(awful.client.getmaster())
  end, { description = 'move to master', group = 'client' }),
  awful.key({ k.super, k.ctrl }, 'l', function(c)
    c:move_to_screen()
  end, { description = 'move to left screen', group = 'client' }),
  awful.key({ k.super, k.ctrl }, 'h', function(c)
    c:move_to_screen()
  end, { description = 'move to right screen', group = 'client' }),
  awful.key({ k.super }, 't', function(c)
    c.ontop = not c.ontop
  end, { description = 'toggle keep on top', group = 'client' }),
  awful.key({ k.super }, 'n', function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, { description = 'minimize', group = 'client' }),
  awful.key({ k.super }, 'm', function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = '(un)maximize', group = 'client' }),
  awful.key({ k.super, k.ctrl }, 'm', function(c)
    c.maximized_horizontally = not c.maximized_horizontally
    c:raise()
  end, { description = '(un)maximize', group = 'client' }),
  awful.key({ k.super, k.ctrl }, '%', function(c)
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
  awful.key({ k.alt }, 'p', function()
    os.execute 'screenshot'
  end, { description = 'take a screenshot', group = 'hotkeys' }),

  -- X screen locker
  -- awful.key({ alt, "Control" }, "l", function()
  -- 	os.execute(scrlocker)
  -- end, { description = "lock screen", group = "hotkeys" }),

  -- Show help
  awful.key({ k.super }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),

  -- Tag browsing
  awful.key({ k.super }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
  awful.key({ k.super }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
  awful.key({ k.super }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),

  -- Non-empty tag browsing
  awful.key({ k.alt }, 'Left', function()
    lain.util.tag_view_nonempty(-1)
  end, { description = 'view  previous nonempty', group = 'tag' }),
  awful.key({ k.alt }, 'Right', function()
    lain.util.tag_view_nonempty(1)
  end, { description = 'view  previous nonempty', group = 'tag' }),

  -- Default client focus
  awful.key({ k.alt }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = 'client' }),
  awful.key({ k.alt }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = 'client' }),

  -- By-direction client focus
  awful.key({ k.super }, k.left, function()
    awful.client.focus.global_bydirection 'left'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus left', group = 'client' }),
  awful.key({ k.super }, k.down, function()
    awful.client.focus.global_bydirection 'down'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus down', group = 'client' }),
  awful.key({ k.super }, k.up, function()
    awful.client.focus.global_bydirection 'up'
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'focus up', group = 'client' }),
  awful.key({ k.super }, k.right, function()
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
  awful.key({ k.super }, 'w', function()
    awful.util.mymainmenu:show()
  end, { description = 'show main menu', group = 'awesome' }),

  -- Layout manipulation
  awful.key({ k.super, 'Shift' }, 'j', function()
    awful.client.swap.byidx(1)
  end, { description = 'swap with next client by index', group = 'client' }),
  awful.key({ k.super, 'Shift' }, 'k', function()
    awful.client.swap.byidx(-1)
  end, { description = 'swap with previous client by index', group = 'client' }),
  -- awful.key({ k.super, 'Control' }, 'j', function()
  --   awful.screen.focus_relative(1)
  -- end, { description = 'focus the next screen', group = 'screen' }),
  -- awful.key({ k.super, 'Control' }, 'k', function()
  --   awful.screen.focus_relative(-1)
  -- end, { description = 'focus the previous screen', group = 'screen' }),
  awful.key({ k.super }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),
  awful.key({ k.super }, 'Tab', function()
    if cycle_only_prev then
      awful.client.focus.history.previous()
    else
      awful.client.focus.byidx(-1)
    end
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'cycle with previous/go back', group = 'client' }),

  -- Show/hide wibox
  awful.key({ k.super }, 'b', function()
    for s in screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      end
    end
  end, { description = 'toggle wibox', group = 'awesome' }),

  -- On-the-fly useless gaps change
  awful.key({ k.alt, 'Control' }, '+', function()
    lain.util.useless_gaps_resize(1)
  end, { description = 'increment useless gaps', group = 'tag' }),
  awful.key({ k.alt, 'Control' }, '-', function()
    lain.util.useless_gaps_resize(-1)
  end, { description = 'decrement useless gaps', group = 'tag' }),

  -- Dynamic tagging
  awful.key({ k.super, 'Shift' }, 'n', function()
    lain.util.add_tag()
  end, { description = 'add new tag', group = 'tag' }),
  -- awful.key({ super, "Shift" }, "r", function()
  -- 	lain.util.rename_tag()
  -- end, { description = "rename tag", group = "tag" }),
  awful.key({ k.super, 'Shift' }, 'Left', function()
    lain.util.move_tag(-1)
  end, { description = 'move tag to the left', group = 'tag' }),
  awful.key({ k.super, 'Shift' }, 'Right', function()
    lain.util.move_tag(1)
  end, { description = 'move tag to the right', group = 'tag' }),
  awful.key({ k.super, 'Shift' }, 'd', function()
    lain.util.delete_tag()
  end, { description = 'delete tag', group = 'tag' }),

  -- Standard program
  awful.key({ k.super }, 'Return', function()
    awful.spawn(terminal)
  end, { description = 'open a terminal', group = 'launcher' }),
  awful.key({ k.super, k.shift }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  awful.key({ k.super, k.shift }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

  awful.key({ k.super, k.alt }, 'l', function()
    awful.tag.incmwfact(0.05)
  end, { description = 'increase master width factor', group = 'layout' }),
  awful.key({ k.super, k.alt }, 'h', function()
    awful.tag.incmwfact(-0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),
  awful.key({ k.super, 'Shift' }, 'h', function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),
  awful.key({ k.super, 'Shift' }, 'l', function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),
  -- awful.key({ k.super, 'Control' }, 'h', function()
  --   awful.tag.incncol(1, nil, true)
  -- end, { description = 'increase the number of columns', group = 'layout' }),
  -- awful.key({ k.super, 'Control' }, 'l', function()
  --   awful.tag.incncol(-1, nil, true)
  -- end, { description = 'decrease the number of columns', group = 'layout' }),
  awful.key({ k.super }, 'space', function()
    awful.layout.inc(1)
  end, { description = 'select next', group = 'layout' }),
  awful.key({ k.super, 'Shift' }, 'space', function()
    awful.layout.inc(-1)
  end, { description = 'select previous', group = 'layout' }),

  awful.key({ k.super, 'Control' }, 'n', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal('request::activate', 'key.unminimize', { raise = true })
    end
  end, { description = 'restore minimized', group = 'client' }),

  -- Dropdown application
  awful.key({ k.super }, 'z', function()
    awful.screen.focused().quake:toggle()
  end, { description = 'dropdown application', group = 'launcher' }),

  -- Widgets popups
  -- awful.key({ alt }, 'c', function()
  --   if beautiful.cal then
  --     beautiful.cal.show(7)
  --   end
  -- end, { description = 'show calendar', group = 'widgets' }),
  -- awful.key({ alt }, 'h', function()
  --   if beautiful.fs then
  --     beautiful.fs.show(7)
  --   end
  -- end, { description = 'show filesystem', group = 'widgets' }),
  -- awful.key({ alt }, 'w', function()
  --   if beautiful.weather then
  --     beautiful.weather.show(7)
  --   end
  -- end, { description = 'show weather', group = 'widgets' }),

  -- Screen brightness
  awful.key({}, 'XF86MonBrightnessUp', function()
    os.execute 'xbacklight -inc 10'
  end, { description = '+10%', group = 'hotkeys' }),
  awful.key({}, 'XF86MonBrightnessDown', function()
    os.execute 'xbacklight -dec 10'
  end, { description = '-10%', group = 'hotkeys' }),

  -- ALSA volume control
  awful.key({ k.alt }, 'Up', function()
    os.execute(string.format('amixer -q set %s 1%%+', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume up', group = 'hotkeys' }),
  awful.key({ k.alt }, 'Down', function()
    os.execute(string.format('amixer -q set %s 1%%-', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume down', group = 'hotkeys' }),
  awful.key({ k.alt }, 'm', function()
    os.execute(string.format('amixer -q set %s toggle', beautiful.volume.togglechannel or beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'toggle mute', group = 'hotkeys' }),
  awful.key({ k.alt, 'Control' }, 'm', function()
    os.execute(string.format('amixer -q set %s 100%%', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume 100%', group = 'hotkeys' }),
  awful.key({ k.alt, 'Control' }, '0', function()
    os.execute(string.format('amixer -q set %s 0%%', beautiful.volume.channel))
    beautiful.volume.update()
  end, { description = 'volume 0%', group = 'hotkeys' }),

  -- MPD control
  awful.key({ k.alt, 'Control' }, 'Up', function()
    os.execute 'mpc toggle'
    beautiful.mpd.update()
  end, { description = 'mpc toggle', group = 'widgets' }),
  awful.key({ k.alt, 'Control' }, 'Down', function()
    os.execute 'mpc stop'
    beautiful.mpd.update()
  end, { description = 'mpc stop', group = 'widgets' }),
  awful.key({ k.alt, 'Control' }, 'Left', function()
    os.execute 'mpc prev'
    beautiful.mpd.update()
  end, { description = 'mpc prev', group = 'widgets' }),
  awful.key({ k.alt, 'Control' }, 'Right', function()
    os.execute 'mpc next'
    beautiful.mpd.update()
  end, { description = 'mpc next', group = 'widgets' }),
  awful.key({ k.alt }, '0', function()
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
  awful.key({ k.super }, 'c', function()
    awful.spawn.with_shell 'xsel | xsel -i -b'
  end, { description = 'copy terminal to gtk', group = 'hotkeys' }),
  -- Copy clipboard to primary (gtk to terminals)
  awful.key({ k.super }, 'v', function()
    awful.spawn.with_shell 'xsel -b | xsel'
  end, { description = 'copy gtk to terminal', group = 'hotkeys' }),

  -- User programs
  awful.key({ k.super }, 'o', function()
    awful.spawn(browser)
  end, { description = 'run browser', group = 'launcher' }),

  -- Default
  --[[ Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    --]]
  -- [[ dmenu
  awful.key({ k.super }, 'd', function()
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
  awful.key({ k.super }, 'r', function()
    awful.screen.focused().mypromptbox:run()
  end, { description = 'run prompt', group = 'launcher' }),

  awful.key({ k.super }, 'x', function()
    awful.prompt.run {
      prompt = 'Run Lua code: ',
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval',
    }
  end, { description = 'lua execute prompt', group = 'awesome' })
  -- ]]
)

return M
