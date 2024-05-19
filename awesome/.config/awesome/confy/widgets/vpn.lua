local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'

local const = require 'confy.configuration.const'

local up = const.misc.theme_dir .. 'confy/theme/bar/widgets/svgs/arrow_up.svg'
local down = const.misc.theme_dir .. 'confy/theme/bar/widgets/svgs/arrow_down.svg'

local status = wibox.widget {
  image = down,
  resize = true,
  widget = wibox.widget.imagebox,
}

status:connect_signal('button::press', function(_, _, button)
  awful.spawn.with_shell '~/.config/vpn/ss.sh'
end)

gears.timer {
  timeout = 1,
  call_now = true,
  autostart = true,
  callback = function()
    awful.spawn.easy_async('pgrep openvpn', function(stdout)
      if stdout == '' then
        status.image = down
      else
        status.image = up
      end
    end)
  end,
}

return status
