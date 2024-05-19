local awesome = awesome
local root = root
local screen = screen
local client = client

local confy = require 'confy.configuration'
local layout = require 'confy.layout'
local keys = require 'confy.keys'
local rules = require 'confy.rules'
local theme = require 'confy.theme'

confy:autostart()
confy:extend_globals()

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- local client_keys, global_keys = keys:get()
-- sumtin like that
-- could start with keys and rules
-- NOTE: Observng client_keys i think we will go back
-- to refactor as window,screen,client,display,monitor,whatev
-- rules is probably inside screen or client module
-- CANT NAME THEM THAT THOUGH

root.set:keys(confy.keys.global)
root.set:buttons { confy.buttons.global }

clientbuttons = confy.buttons.client
clientkeys = confy.keys.client

rules:set()
layout:set()

theme:set()

confy:set_signals()
-- awesome:connect()
