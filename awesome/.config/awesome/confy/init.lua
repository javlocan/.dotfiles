----------------------------------------------------------------------------
---------- ░█▀▀▀ ░█▄─░█ -- ░█▀▄▀█  █▀▀█ ▀█▀ ░█▄ ░█ ▄▀ ▀▄ -------------------
---------- ░█▀▀▀ ░█░█░█ -- ░█░█░█ ░█▄▄█ ░█  ░█░█░█ █   █ -------------------
---------- ░█ -- ░█- ▀█ -- ░█- ░█ ░█ ░█ ▄█▄ ░█- ▀█ ▀▄ ▄▀ -------------------
----------------------------------------------------------------------------
---  The project is built on top of awesome-copycats, thanks y'all  --------
----------------------------------------------------------------------------
local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local tags = require 'confy.tags'
local screens = require 'confy.screens'
local theme = require 'confy.theme'
local signals = require 'confy.signals'
----------------------------------------------------------------------------
---  awesomewm defines a global context* which includes this variables
---@diagnostic disable-next-line: undefined-global, unused-local
local awesome, root, screen, client, tag = awesome, root, screen, client, tag
----------------------------------------------------------------------------
-- TODO: DEPENDENCY FLOW WILL NOT BE SHOW cause
-- awful.keyboard and awful.mouse expose better key handling
--
---  confy functions as a re-export barrel for the purpose of making
---  1. dependency flow and interactions transparent between modules
---  2. quick tinkering possible through this file with vim gd and +
----------------------------------------------------------------------------
confy:autostart { autorun = true }
screens:set()
theme:load { keys = confy.keys.global, buttons = confy.buttons.global }
theme:set { bar = true, menu = true, wallpaper = true }

require 'test'
require('awful.keyboard').append_global_keybinding(confy.keys.global)

tags:bind_keys()
tags:bind_buttons()
-- global:set { keys = confy.keys.global, buttons = confy.buttons.global }
clients:set { keys = confy.keys.client, buttons = confy.buttons.client }

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- sumtin like that

signals:connect()
----------------------------------------------------------------------------
--- * this concept reminds me of frontendy-ux's-stuff more than others
----------------------------------------------------------------------------
