-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local awesome_path = '/home/javlocan/.config/awesome/'
local dpi = require('beautiful.xresources').apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = awesome_path .. 'background'
-- }}}

-- {{{ Styles
theme.font = 'mono 9'
theme.opacity = 0.9

-- {{{ Colors
local palette = {}
palette.white = '#DCDCCC'
palette.black = '#1E2320'
palette.gray = '#3F3F3F'
palette.purple = '#312376'
palette.yellow = '#F0DFAF'

local p = palette
theme.secondary = p.purple
theme.neutral = p.white
theme.accent = p.yellow
theme.strong = '#CC9393'

theme.fg_normal = theme.neutral
theme.fg_focus = theme.accent
theme.fg_urgent = theme.strong
theme.bg_normal = p.gray
theme.bg_focus = p.black
theme.bg_urgent = p.gray
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap = dpi(3)
theme.border_width = dpi(3)
theme.border_normal = '#3F3F3F'
theme.border_focus = '#6F6F6F'
theme.border_marked = '#CC9393'
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = '#3F3F3F'
theme.titlebar_bg_normal = '#3F3F3F'
-- }}}

theme.taglist_fg_empty = p.gray
theme.taglist_fg_occupied = p.white
theme.taglist_bg_focus = p.gray
theme.taglist_fg_focus = p.white
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = '#CC9393'
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel = awesome_path .. 'zenburn/taglist/squarefz.png'
theme.taglist_squares_unsel = awesome_path .. 'zenburn/taglist/squarez.png'
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon = awesome_path .. 'zenburn/awesome-icon.png'
theme.menu_submenu_icon = awesome_path .. 'default/submenu.png'
-- }}}

-- {{{ Layout
theme.layout_tile = awesome_path .. 'zenburn/layouts/tile.png'
theme.layout_tileleft = awesome_path .. 'zenburn/layouts/tileleft.png'
theme.layout_tilebottom = awesome_path .. 'zenburn/layouts/tilebottom.png'
theme.layout_tiletop = awesome_path .. 'zenburn/layouts/tiletop.png'
theme.layout_fairv = awesome_path .. 'zenburn/layouts/fairv.png'
theme.layout_fairh = awesome_path .. 'zenburn/layouts/fairh.png'
theme.layout_spiral = awesome_path .. 'zenburn/layouts/spiral.png'
theme.layout_dwindle = awesome_path .. 'zenburn/layouts/dwindle.png'
theme.layout_max = awesome_path .. 'zenburn/layouts/max.png'
theme.layout_fullscreen = awesome_path .. 'zenburn/layouts/fullscreen.png'
theme.layout_magnifier = awesome_path .. 'zenburn/layouts/magnifier.png'
theme.layout_floating = awesome_path .. 'zenburn/layouts/floating.png'
theme.layout_cornernw = awesome_path .. 'zenburn/layouts/cornernw.png'
theme.layout_cornerne = awesome_path .. 'zenburn/layouts/cornerne.png'
theme.layout_cornersw = awesome_path .. 'zenburn/layouts/cornersw.png'
theme.layout_cornerse = awesome_path .. 'zenburn/layouts/cornerse.png'
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = awesome_path .. 'zenburn/titlebar/close_focus.png'
theme.titlebar_close_button_normal = awesome_path .. 'zenburn/titlebar/close_normal.png'

theme.titlebar_minimize_button_normal = awesome_path .. 'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = awesome_path .. 'default/titlebar/minimize_focus.png'

theme.titlebar_ontop_button_focus_active = awesome_path .. 'zenburn/titlebar/ontop_focus_active.png'
theme.titlebar_ontop_button_normal_active = awesome_path .. 'zenburn/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_inactive = awesome_path .. 'zenburn/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_inactive = awesome_path .. 'zenburn/titlebar/ontop_normal_inactive.png'

theme.titlebar_sticky_button_focus_active = awesome_path .. 'zenburn/titlebar/sticky_focus_active.png'
theme.titlebar_sticky_button_normal_active = awesome_path .. 'zenburn/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_inactive = awesome_path .. 'zenburn/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_inactive = awesome_path .. 'zenburn/titlebar/sticky_normal_inactive.png'

theme.titlebar_floating_button_focus_active = awesome_path .. 'zenburn/titlebar/floating_focus_active.png'
theme.titlebar_floating_button_normal_active = awesome_path .. 'zenburn/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_inactive = awesome_path .. 'zenburn/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_inactive = awesome_path .. 'zenburn/titlebar/floating_normal_inactive.png'

theme.titlebar_maximized_button_focus_active = awesome_path .. 'zenburn/titlebar/maximized_focus_active.png'
theme.titlebar_maximized_button_normal_active = awesome_path .. 'zenburn/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_inactive = awesome_path .. 'zenburn/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_inactive = awesome_path .. 'zenburn/titlebar/maximized_normal_inactive.png'
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
