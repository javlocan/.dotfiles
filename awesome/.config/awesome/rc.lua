--[[-----------------------------------------------
      AWESOME WM CONFIGURATION? by javlocan.dev
    -----------------------------------------------
    Some globals are maintained longside "awesome":
    { client, screen, root, globalkeys, clientkeys,
    clientbuttons } They are mostly handled in 
    keys and rules module.
---------------------------------------------------]]

pcall(require, 'luarocks.loader')

-- local awesome = awesome
-- local screen = screen
-- local root = root
-- local client = client

local start = require 'start'
local rules = require 'rules'
local keys = require 'keys'
local mscreen = require 'mscreen'
-- local window = require 'window'
local config = require 'config'

-- NOTE: ORDER IS IMPORTANT
-- SO... WHAT TO DO?
-- Necesito una justificacion o sistematizacion
-- de algún tipo para el orden
-- FIX: Quizá si voy pasando lo que
-- voy generando queda claro el orden
-- por sí solo. No sé siquiera si se
-- puede. Entonces el estado donde?
-- Es realmente un estado?

start:handle_awesome_errors()
start:run_once()
mscreen:set_layout()
mscreen:set_taglist()
mscreen:set_tasklist()
start:set_theme()
mscreen:set_menu()
keys:set()
rules:set()
-- window:set_titlebars()
config:set_signals()

-- TODO: ESTO ESTÁ MAL PERO ES MEJOR QUE NADA
-- Creo que tiene el problema de no estar guardando bien
-- que tag esta en qué escritorio. A lo mejor aún quiero separarlas
-- por numeros.

awesome.connect_signal('exit', function(reason_restart)
  if not reason_restart then
    return
  end

  local file = io.open('/tmp/awesomewm-last-selected-tags', 'w+')

  for s in screen do
    file:write(s.selected_tag.index, '\n')
  end

  file:close()
end)

awesome.connect_signal('startup', function()
  local file = io.open('/tmp/awesomewm-last-selected-tags', 'r')
  if not file then
    return
  end

  local selected_tags = {}

  for line in file:lines() do
    table.insert(selected_tags, tonumber(line))
  end

  for s in screen do
    local i = selected_tags[s.index]
    local t = s.tags[i]
    t:view_only()
  end

  file:close()
end)
