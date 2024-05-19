local gears = require 'gears'
local awful = require 'awful'
local lain = require 'lain'

local M = {}

local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

M.misc = {
  mytable = mytable,
  vi_focus = false, -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
  conf_dir = os.getenv 'HOME' .. '/.config/awesome',
  theme_dir = os.getenv 'HOME' .. '/.config/awesome/confy/theme',
  -- conf_dir = os.getenv 'HOME' .. '/.config/awesome',
  terminal = 'alacritty',
  editor = os.getenv 'EDITOR' or 'nvim',
}

require('naughty').notify { text = M.misc.theme_dir .. '.lua' }

M.keys = {
  super = 'Mod4',
  alt = 'Mod1',
  ctrl = 'Control',
  shift = 'Shift',
  left = 'h',
  down = 'j',
  up = 'k',
  right = 'l',
}

M.layout_list = {
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

M.autostart_cmd_list = {
  'redshift -l 38:-5',
  'picom --no-frame-pacing --config ' .. M.misc.conf_dir .. '/picom.conf',
  'xclipd',
  'setxkbmap custom',
}

return M
