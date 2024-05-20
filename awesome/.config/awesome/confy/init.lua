-- confy reexports some variables with the pourpose in mind
-- of making dependencies transparent

local confy = require 'confy.configuration'

local clients = require 'confy.clients'
local global = require 'confy.global'
local screens = require 'confy.screens'
local theme = require 'confy.theme'
local signals = require 'confy.signals'

---@diagnostic disable-next-line: undefined-global, unused-local
local awesome, root = awesome, root
---

-- G = {
--   client = client,
--   screen = screen,
-- }

confy:autostart()

screens:set() -- se va pa screen
theme:set { bar = true }

global:set { keys = confy.keys.global, buttons = confy.buttons.global }
clients:set(confy.keys.client, confy.buttons.client)

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- sumtin like that

signals:connect()
