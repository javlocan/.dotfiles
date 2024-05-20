local awful = require 'awful'
local beautiful = require 'beautiful'

local const = require 'confy.configuration.const'

local wallpaper = require 'confy.theme.wallpaper'
local menu = require 'confy.theme.menu'
local bar = require 'confy.theme.bar'

local M = {}

M.set = function(_, opts)
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  beautiful.init(const.file.styles)

  -- TODO: FIX
  -- FIX: This is not properly implemented
  bar.on = opts and opts.bar ~= nil and opts.bar
  wallpaper.on = opts and opts.wallpaper or true

  if opts and opts.menu then
    menu:set()
  end

  awful.screen.connect_for_each_screen(function(s)
    if wallpaper.on then
      wallpaper:set(s)
    end

    -- require('naughty').notify { text = 'Bar is ' .. (bar.on and string.format('%s', opts.bar) or 'AY') }

    if bar.on then
      bar:set(s)
    end

    -- TODO: repartir escritorios del 1 al 0 entre 2 screens
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
  end)
end

return M
