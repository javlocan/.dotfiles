----------------------------------------------------------------------------
------------ ░█▀▀▀ ░█▄─░█ -- ░█▀▄▀█  █▀▀█ ▀█▀ ░█▄ ░█ ▄▀ ▀▄ -----------------
------------ ░█▀▀▀ ░█░█░█ -- ░█░█░█ ░█▄▄█ ░█  ░█░█░█ █   █ -----------------
------------ ░█ -- ░█- ▀█ -- ░█- ░█ ░█ ░█ ▄█▄ ░█- ▀█ ▀▄ ▄▀ -----------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local tags = require 'confy.tags'
local screens = require 'confy.screens'
local theme = require 'confy.theme'
local signals = require 'confy.signals'
----------------------------------------------------------------------------
--  awesomewm defines a global context* which includes this variables
---@diagnostic disable-next-line: undefined-global, unused-local
local awesome, root, screen, client, tag = awesome, root, screen, client, tag
----------------------------------------------------------------------------
-- TODO: Change this disclaimer to better explain new flow
--
--  confy functions as a re-export barrel for the purpose of making
--  1. dependency flow and interactions transparent between modules
--  2. quick tinkering possible through this file with vim gd and +
----------------------------------------------------------------------------
confy:autostart { autorun = true }
screens:set()
theme:load { keys = confy.keys.global, buttons = confy.buttons.global }
theme:set { bar = true, menu = true, wallpaper = true }

require 'confy.screenshots'
require('awful.keyboard').append_global_keybinding(confy.keys.global)

tags:bind_keys()
tags:bind_buttons()

clients:set { keys = confy.keys.client, buttons = confy.buttons.client }

-- TODO:
-- everything works on a signal now

signals:connect()
----------------------------------------------------------------------------
-- * this concept reminds me of frontendy-ux's-stuff more than others
----------------------------------------------------------------------------
