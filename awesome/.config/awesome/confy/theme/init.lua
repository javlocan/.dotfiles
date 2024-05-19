local awful = require 'awful'
local beautiful = require 'beautiful'

local const = require 'confy.configuration.const'
local wallpaper = require 'confy.theme.wallpaper'
local bar = require 'confy.theme.bar'

local M = {}

M.set = function()
  require 'awful.autofocus'
  awful.util.terminal = const.misc.terminal
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  beautiful.init(const.file.styles)

  awful.screen.connect_for_each_screen(function(s)
    wallpaper:set(s)
    bar:set(s)
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
  end)
end

return M
