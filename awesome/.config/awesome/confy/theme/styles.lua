local dpi = require('beautiful.xresources').apply_dpi

local const = require 'confy.configuration.const'

local styles = {}

-- styles.dir = const.misc.theme_dir
styles.dir = const.dir.assets
styles.wallpaper = styles.dir .. '/background.png'
styles.font = 'mono 9'

styles.fg_normal = '#FEFEFE'
styles.fg_focus = '#32D6FF'
styles.fg_urgent = '#C83F11'
styles.bg_normal = '#222222'
styles.bg_focus = '#1E2320'
styles.bg_urgent = '#3F3F3F'

styles.useless_gap = 3
styles.border_width = dpi(3)
styles.border_normal = '#3F3F3F'
styles.border_focus = '#6F6F6F'
styles.border_marked = '#CC9393'

styles.taglist_fg_focus = '#00CCFF'
styles.tasklist_bg_focus = '#222222'
styles.tasklist_fg_focus = '#00CCFF'

styles.titlebar_bg_focus = '#3F3F3F'
styles.titlebar_bg_normal = '#3F3F3F'
styles.titlebar_bg_focus = styles.bg_focus
styles.titlebar_bg_normal = styles.bg_normal
styles.titlebar_fg_focus = styles.fg_focus

styles.menu_height = dpi(20)
styles.menu_width = dpi(160)
styles.menu_submenu_icon = styles.dir .. '/icons/submenu.png'
styles.awesome_icon = styles.dir .. '/icons/awesome.png'

styles.taglist_squares_sel = styles.dir .. '/icons/square_sel.png'
styles.taglist_squares_unsel = styles.dir .. '/icons/square_unsel.png'

styles.layout_tile = styles.dir .. '/icons/tile.png'
styles.layout_tileleft = styles.dir .. '/icons/tileleft.png'
styles.layout_tilebottom = styles.dir .. '/icons/tilebottom.png'
styles.layout_tiletop = styles.dir .. '/icons/tiletop.png'
styles.layout_fairv = styles.dir .. '/icons/fairv.png'
styles.layout_fairh = styles.dir .. '/icons/fairh.png'
styles.layout_spiral = styles.dir .. '/icons/spiral.png'
styles.layout_dwindle = styles.dir .. '/icons/dwindle.png'
styles.layout_spiral_dwindle = styles.dir .. '/icons/dwindle.png'
styles.layout_max = styles.dir .. '/icons/max.png'
styles.layout_fullscreen = styles.dir .. '/icons/fullscreen.png'
styles.layout_magnifier = styles.dir .. '/icons/magnifier.png'
styles.layout_floating = styles.dir .. '/icons/floating.png'

styles.widget_ac = styles.dir .. '/icons/ac.png'
styles.widget_battery = styles.dir .. '/icons/battery.png'
styles.widget_battery_low = styles.dir .. '/icons/battery_low.png'
styles.widget_battery_empty = styles.dir .. '/icons/battery_empty.png'
styles.widget_brightness = styles.dir .. '/icons/brightness.png'
styles.widget_mem = styles.dir .. '/icons/mem.png'
styles.widget_cpu = styles.dir .. '/icons/cpu.png'
styles.widget_temp = styles.dir .. '/icons/temp.png'
styles.widget_net = styles.dir .. '/icons/net.png'
styles.widget_hdd = styles.dir .. '/icons/hdd.png'
styles.widget_music = styles.dir .. '/icons/note.png'
styles.widget_music_on = styles.dir .. '/icons/note_on.png'
styles.widget_music_pause = styles.dir .. '/icons/pause.png'
styles.widget_music_stop = styles.dir .. '/icons/stop.png'
styles.widget_vol = styles.dir .. '/icons/vol.png'
styles.widget_vol_low = styles.dir .. '/icons/vol_low.png'
styles.widget_vol_no = styles.dir .. '/icons/vol_no.png'
styles.widget_vol_mute = styles.dir .. '/icons/vol_mute.png'
styles.widget_mail = styles.dir .. '/icons/mail.png'
styles.widget_mail_on = styles.dir .. '/icons/mail_on.png'
styles.widget_task = styles.dir .. '/icons/task.png'
styles.widget_scissors = styles.dir .. '/icons/scissors.png'

styles.tasklist_plain_task_name = true
styles.tasklist_disable_icon = true

styles.titlebar_close_button_focus = styles.dir .. '/icons/titlebar/close_focus.png'
styles.titlebar_close_button_normal = styles.dir .. '/icons/titlebar/close_normal.png'
styles.titlebar_ontop_button_focus_active = styles.dir .. '/icons/titlebar/ontop_focus_active.png'
styles.titlebar_ontop_button_normal_active = styles.dir .. '/icons/titlebar/ontop_normal_active.png'
styles.titlebar_ontop_button_focus_inactive = styles.dir .. '/icons/titlebar/ontop_focus_inactive.png'
styles.titlebar_ontop_button_normal_inactive = styles.dir .. '/icons/titlebar/ontop_normal_inactive.png'
styles.titlebar_sticky_button_focus_active = styles.dir .. '/icons/titlebar/sticky_focus_active.png'
styles.titlebar_sticky_button_normal_active = styles.dir .. '/icons/titlebar/sticky_normal_active.png'
styles.titlebar_sticky_button_focus_inactive = styles.dir .. '/icons/titlebar/sticky_focus_inactive.png'
styles.titlebar_sticky_button_normal_inactive = styles.dir .. '/icons/titlebar/sticky_normal_inactive.png'
styles.titlebar_floating_button_focus_active = styles.dir .. '/icons/titlebar/floating_focus_active.png'
styles.titlebar_floating_button_normal_active = styles.dir .. '/icons/titlebar/floating_normal_active.png'
styles.titlebar_floating_button_focus_inactive = styles.dir .. '/icons/titlebar/floating_focus_inactive.png'
styles.titlebar_floating_button_normal_inactive = styles.dir .. '/icons/titlebar/floating_normal_inactive.png'
styles.titlebar_maximized_button_focus_active = styles.dir .. '/icons/titlebar/maximized_focus_active.png'
styles.titlebar_maximized_button_normal_active = styles.dir .. '/icons/titlebar/maximized_normal_active.png'
styles.titlebar_maximized_button_focus_inactive = styles.dir .. '/icons/titlebar/maximized_focus_inactive.png'
styles.titlebar_maximized_button_normal_inactive = styles.dir .. '/icons/titlebar/maximized_normal_inactive.png'

styles.notification_font = 'mono 11'
styles.notification_bg = styles.bg_focus
styles.notification_fg = styles.fg_focus
styles.notification_border_width = styles.border_width
styles.notification_border_color = styles.border_normal
-- theme.notification_shape
styles.notification_opacity = 0.9
styles.notification_margin = dpi(100)
-- theme.notification_width
-- theme.notification_height
-- theme.notification_max_width = dpi(240)
-- theme.notification_max_height = dpi(120)
-- theme.notification_icon_size = dpi

return styles
