local naughty = require 'naughty'
local awful = require 'awful'
local gears = require 'gears'

local const = require 'confy.configuration'
local keys = const.keys

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

local modkey = 'Mod4'

local function saved_screenshot(args)
  local ss = awful.screenshot(args)

  local function notify(self)
    naughty.notify {
      title = self.file_name,
      text = 'Screenshot saved in ' .. ss.directory,
      icon = self.surface,
      icon_size = 128,
    }
  end

  if args.auto_save_delay > 0 then
    ss:connect_signal('file::saved', notify)
  else
    notify(ss)
  end

  return ss
end

local function delayed_screenshot(args)
  local ss = saved_screenshot(args)
  local notif = naughty.notify {
    title = 'Screenshot in:',
    text = tostring(args.auto_save_delay) .. ' seconds',
  }

  ss:connect_signal('timer::tick', function(_, remain)
    notif.text = tostring(remain) .. ' seconds'
  end)

  ss:connect_signal('timer::timeout', function()
    if notif then
      notif:destroy()
    end
  end)

  return ss
end

local directory = require('confy.configuration.const').dir.screenshots

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings {
    awful.key({ modkey }, 'Print', function(c)
      naughty.notify { text = 'Print!' }
      saved_screenshot { auto_save_delay = 0, client = c, directory = directory }
    end, { description = 'take client screenshot', group = 'client' }),
    awful.key({ modkey, 'Shift' }, 'Print', function(c)
      saved_screenshot { auto_save_delay = 0, interactive = true, client = c }
    end, { description = 'take interactive client screenshot', group = 'client' }),
    awful.key({ modkey, 'Control' }, 'Print', function(c)
      delayed_screenshot { auto_save_delay = 5, client = c }
    end, { description = 'take screenshot in 5 seconds', group = 'client' }),
    awful.key({ modkey, 'Shift', 'Control' }, 'Print', function(c)
      delayed_screenshot { auto_save_delay = 5, interactive = true, client = c }
    end, { description = 'take interactive screenshot in 5 seconds', group = 'client' }),
  }
end)

keys.global = mytable.join(
  keys.global,
  awful.key({}, 'Print', function()
    naughty.notify { text = 'Print!' }
    saved_screenshot { auto_save_delay = 0 }
  end, { description = 'take screenshot', group = 'client' }),
  awful.key({ 'Shift' }, 'Print', function()
    saved_screenshot { auto_save_delay = 0, interactive = true }
  end, { description = 'take interactive screenshot', group = 'client' }),
  awful.key({ 'Control' }, 'Print', function()
    delayed_screenshot { auto_save_delay = 5 }
  end, { description = 'take screenshot in 5 seconds', group = 'client' }),
  awful.key({ 'Shift', 'Control' }, 'Print', function()
    delayed_screenshot { auto_save_delay = 5, interactive = true }
  end, { description = 'take interactive screenshot in 5 seconds', group = 'client' })
)

-- awful.keyboard.append_global_keybindings {
--   awful.key({}, 'Print', function()
--     naughty.notify { text = 'Print!' }
--     saved_screenshot { auto_save_delay = 0 }
--   end, { description = 'take screenshot', group = 'client' }),
--   awful.key({ 'Shift' }, 'Print', function()
--     saved_screenshot { auto_save_delay = 0, interactive = true }
--   end, { description = 'take interactive screenshot', group = 'client' }),
--   awful.key({ 'Control' }, 'Print', function()
--     delayed_screenshot { auto_save_delay = 5 }
--   end, { description = 'take screenshot in 5 seconds', group = 'client' }),
--   awful.key({ 'Shift', 'Control' }, 'Print', function()
--     delayed_screenshot { auto_save_delay = 5, interactive = true }
--   end, { description = 'take interactive screenshot in 5 seconds', group = 'client' }),
-- }
