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
local screen = require 'screen'
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
screen:set_layout()
screen:set_taglist()
screen:set_tasklist()
start:set_theme()
screen:set_menu()
keys:set()
rules:set()
-- window:set_titlebars()
config:set_signals()
