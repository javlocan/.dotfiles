local awful = require 'awful'
local beautiful = require 'beautiful'

local const = require 'confy.configuration.const'
local keys = require 'confy.configuration.keys'
local buttons = require 'confy.configuration.buttons'

local wallpaper = require 'confy.theme.wallpaper'
local menu = require 'confy.theme.menu'
local bar = require 'confy.theme.bar'

local M = {}

---@private
M.loaded = false

---@param _ _self
---@param args { keys: keys, buttons: buttons }
---bindings from widgets will added to the ones passed as arguments
---# for it to work must be done before keys or theme are set!
M.load = function(_, args)
  ---@protected
  ---@meta
  M.keys = args and args.keys or keys.global
  ---@protected
  M.buttons = args and args.buttons or buttons.global
  M.loaded = true
end

---@class theme.options
---@field bar? boolean load bar on each screen
---@field menu? boolean makes menu accesible (super+w)
---@field wallpaper? boolean loads a wallpaper for both screens

---@param _ _self
---@param opts? theme.options
---**defines wether or not to load:**
--- * bar       -- _default=true_
--- * wallpaper -- _default=true_
--- * menu      -- _default=true_
---and if `theme:load(args)` hasn't been called, sets defaults
M.set = function(_, opts)
  awful.util.tagnames = { '1', '2', '3', '4', '5' }

  beautiful.init(const.file.styles)

  if not M.loaded then
    M:load { keys = keys.global, buttons = buttons.global }
  end

  if opts and opts.bar == false then
  else
    bar.on = true
  end

  if opts and opts.wallpaper == false then
  else
    wallpaper.on = true
  end

  if opts and opts.menu then
    menu:set()
  end

  awful.screen.connect_for_each_screen(function(s)
    if wallpaper.on then
      wallpaper:set(s)
    end

    if bar.on then
      bar:set(s)
    end

    -- TODO: repartir escritorios del 1 al 0 entre 2 screens
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
  end)
end

return M
