-----------------------------------------------------------------------
---------- ░█▀▀▀ ░█▄─░█ -- ░█▀▄▀█  █▀▀█ ▀█▀ ░█▄ ░█ ▄▀ ▀▄ --------------
---------- ░█▀▀▀ ░█░█░█ -- ░█░█░█ ░█▄▄█ ░█  ░█░█░█ █   █ --------------
---------- ░█ -- ░█- ▀█ -- ░█- ░█ ░█ ░█ ▄█▄ ░█- ▀█ ▀▄ ▄▀ --------------
-----------------------------------------------------------------------
---  This project is build on top of awesome-copycats, thanks yall  ---
-----------------------------------------------------------------------
local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local global = require 'confy.global'
local screens = require 'confy.screens'
local theme = require 'confy.theme'
local signals = require 'confy.signals'
-----------------------------------------------------------------------
---  awesomewm defines a global context* which includes this variables
---@diagnostic disable-next-line: undefined-global, unused-local
local awesome, root, screen, client = awesome, root, screen, client
-----------------------------------------------------------------------
---  confy functions as a re-export barrel for the purpose of making
---  1. dependency flow and interactions transparent between modules
---  2. quick tinkering possible through this file with vim gd and +
-----------------------------------------------------------------------
confy:autostart()
screens:set()
theme:set { bar = true, menu = true }
global:set { keys = confy.keys.global, buttons = confy.buttons.global }
clients:set { keys = confy.keys.client, buttons = confy.buttons.client }

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- sumtin like that

signals:connect()
-----------------------------------------------------------------------
--- * this concept reminds me of frontendy-ux's-stuff more than others
-----------------------------------------------------------------------
