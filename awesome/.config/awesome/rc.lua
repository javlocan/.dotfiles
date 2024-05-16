--[[-------------------------
    AWESOME WM CONFIGURATION?
        by javlocan.dev
    -------------------------
            APP STATE
    -------------------------
    Some globals are maintained
    alongside "awesome":
    { client, screen, root,
    globalkeys, clientkeys,
    clientbuttons }
    They are mostly handled in 
    keys and rules module.
    -------------------------]]

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

start:handle_awesome_errors()
start:run_once()
keys:set()
rules:set()
screen:set_layout()
screen:set_taglist()
screen:set_tasklist()
screen:set_menu()
-- window:set_titlebars()
config:set_signals()
config:set_theme()
