-----------------------------------------------------------------------
------ ░█▀▀▀ ░█▄─░█ 　 ░█▀▄▀█ ─█▀▀█ ▀█▀ ░█▄─░█ ▄▀ ▀▄
------ ░█▀▀▀ ░█░█░█ 　 ░█░█░█ ░█▄▄█ ░█─ ░█░█░█ █─ ─█
------ ░█─── ░█──▀█ 　 ░█──░█ ░█─░█ ▄█▄ ░█──▀█ ▀▄ ▄▀-
-----------------------------------------------------------------------
local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local global = require 'confy.global'
local screens = require 'confy.screens'
local theme = require 'confy.theme'
local signals = require 'confy.signals'
-----------------------------------------------------------------------
---   awesomewm defines a global context which includes this variables
---@diagnostic disable-next-line: undefined-global, unused-local
local awesome, root, screen, client = awesome, root, screen, client
-----------------------------------------------------------------------
---  confy functions as a re-export barrel for the purpose of
---  1. making dependency flow more transparent between modules
---  2. turning this file into a relevant one for quick tinkerings
-----------------------------------------------------------------------
confy:autostart()
screens:set() -- se va pa screen
theme:set { bar = true, menu = true }
global:set { keys = confy.keys.global, buttons = confy.buttons.global }
clients:set { keys = confy.keys.client, buttons = confy.buttons.client }

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- sumtin like that

signals:connect()

-----------------------------------------------------------------------
