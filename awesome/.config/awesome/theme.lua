local beautiful = require 'beautiful'
local gears = require 'gears'
local awful = require 'awful'
local dpi = require('beautiful.xresources').apply_dpi
local _, os = math, os

local c = require 'confy.configuration.const'

local theme = {}

theme.dir = c.misc.theme_dir
theme.wallpaper = theme.dir .. '/background'
theme.font = 'mono 9'

theme.fg_normal = '#FEFEFE'
theme.fg_focus = '#32D6FF'
theme.fg_urgent = '#C83F11'
theme.bg_normal = '#222222'
theme.bg_focus = '#1E2320'
theme.bg_urgent = '#3F3F3F'

theme.useless_gap = 3
theme.border_width = dpi(3)
theme.border_normal = '#3F3F3F'
theme.border_focus = '#6F6F6F'
theme.border_marked = '#CC9393'

theme.taglist_fg_focus = '#00CCFF'
theme.tasklist_bg_focus = '#222222'
theme.tasklist_fg_focus = '#00CCFF'

theme.titlebar_bg_focus = '#3F3F3F'
theme.titlebar_bg_normal = '#3F3F3F'
theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_focus

theme.menu_height = dpi(20)
theme.menu_width = dpi(160)
theme.menu_submenu_icon = theme.dir .. '/icons/submenu.png'
theme.awesome_icon = theme.dir .. '/icons/awesome.png'

theme.taglist_squares_sel = theme.dir .. '/icons/square_sel.png'
theme.taglist_squares_unsel = theme.dir .. '/icons/square_unsel.png'

theme.layout_tile = theme.dir .. '/icons/tile.png'
theme.layout_tileleft = theme.dir .. '/icons/tileleft.png'
theme.layout_tilebottom = theme.dir .. '/icons/tilebottom.png'
theme.layout_tiletop = theme.dir .. '/icons/tiletop.png'
theme.layout_fairv = theme.dir .. '/icons/fairv.png'
theme.layout_fairh = theme.dir .. '/icons/fairh.png'
theme.layout_spiral = theme.dir .. '/icons/spiral.png'
theme.layout_dwindle = theme.dir .. '/icons/dwindle.png'
theme.layout_spiral_dwindle = theme.dir .. '/icons/dwindle.png'
theme.layout_max = theme.dir .. '/icons/max.png'
theme.layout_fullscreen = theme.dir .. '/icons/fullscreen.png'
theme.layout_magnifier = theme.dir .. '/icons/magnifier.png'
theme.layout_floating = theme.dir .. '/icons/floating.png'

theme.widget_ac = theme.dir .. '/icons/ac.png'
theme.widget_battery = theme.dir .. '/icons/battery.png'
theme.widget_battery_low = theme.dir .. '/icons/battery_low.png'
theme.widget_battery_empty = theme.dir .. '/icons/battery_empty.png'
theme.widget_brightness = theme.dir .. '/icons/brightness.png'
theme.widget_mem = theme.dir .. '/icons/mem.png'
theme.widget_cpu = theme.dir .. '/icons/cpu.png'
theme.widget_temp = theme.dir .. '/icons/temp.png'
theme.widget_net = theme.dir .. '/icons/net.png'
theme.widget_hdd = theme.dir .. '/icons/hdd.png'
theme.widget_music = theme.dir .. '/icons/note.png'
theme.widget_music_on = theme.dir .. '/icons/note_on.png'
theme.widget_music_pause = theme.dir .. '/icons/pause.png'
theme.widget_music_stop = theme.dir .. '/icons/stop.png'
theme.widget_vol = theme.dir .. '/icons/vol.png'
theme.widget_vol_low = theme.dir .. '/icons/vol_low.png'
theme.widget_vol_no = theme.dir .. '/icons/vol_no.png'
theme.widget_vol_mute = theme.dir .. '/icons/vol_mute.png'
theme.widget_mail = theme.dir .. '/icons/mail.png'
theme.widget_mail_on = theme.dir .. '/icons/mail_on.png'
theme.widget_task = theme.dir .. '/icons/task.png'
theme.widget_scissors = theme.dir .. '/icons/scissors.png'

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true

theme.titlebar_close_button_focus = theme.dir .. '/icons/titlebar/close_focus.png'
theme.titlebar_close_button_normal = theme.dir .. '/icons/titlebar/close_normal.png'
theme.titlebar_ontop_button_focus_active = theme.dir .. '/icons/titlebar/ontop_focus_active.png'
theme.titlebar_ontop_button_normal_active = theme.dir .. '/icons/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_inactive = theme.dir .. '/icons/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_inactive = theme.dir .. '/icons/titlebar/ontop_normal_inactive.png'
theme.titlebar_sticky_button_focus_active = theme.dir .. '/icons/titlebar/sticky_focus_active.png'
theme.titlebar_sticky_button_normal_active = theme.dir .. '/icons/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_inactive = theme.dir .. '/icons/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_inactive = theme.dir .. '/icons/titlebar/sticky_normal_inactive.png'
theme.titlebar_floating_button_focus_active = theme.dir .. '/icons/titlebar/floating_focus_active.png'
theme.titlebar_floating_button_normal_active = theme.dir .. '/icons/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_inactive = theme.dir .. '/icons/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_inactive = theme.dir .. '/icons/titlebar/floating_normal_inactive.png'
theme.titlebar_maximized_button_focus_active = theme.dir .. '/icons/titlebar/maximized_focus_active.png'
theme.titlebar_maximized_button_normal_active = theme.dir .. '/icons/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_inactive = theme.dir .. '/icons/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_inactive = theme.dir .. '/icons/titlebar/maximized_normal_inactive.png'

theme.notification_font = 'mono 11'
theme.notification_bg = theme.bg_focus
theme.notification_fg = theme.fg_focus
theme.notification_border_width = theme.border_width
theme.notification_border_color = theme.border_normal
-- theme.notification_shape
theme.notification_opacity = 0.9
theme.notification_margin = dpi(100)
-- theme.notification_width
-- theme.notification_height
theme.notification_max_width = dpi(240)
theme.notification_max_height = dpi(120)
-- theme.notification_icon_size = dpi

local bar = require 'bar'

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, false)
  end
end

screen.connect_signal('property::geometry', set_wallpaper)

function theme.at_screen_connect(s)
  set_wallpaper(s)
  bar(s)
  awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
end

return theme
