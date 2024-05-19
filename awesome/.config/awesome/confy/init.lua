local awesome = awesome
local root = root
local screen = screen
local client = client

local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local global = require 'confy.global'
local layout = require 'confy.layout'
local theme = require 'confy.theme'
local signals = require 'confy.signals'

confy:autostart()

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
-- FIX: confy puede tener keys buttons, cosas custom dentro
--    PERO PERO PERO PEROOO
--    el resto en su sitio

confy.set:keys(confy.keys.global)
confy.set:buttons { confy.buttons.global }
-- global:set_up { confy.keys.global, confy.buttons.global }
-- confy.set:rules { confy.keys.client, confy.buttons.client }
clients:set_up { confy.keys.client, confy.buttons.client }

layout:set()

theme:set()

signals:connect()
