local confy = require 'confy.configuration'
local clients = require 'confy.clients'
local global = require 'confy.global'
local layout = require 'confy.layout'
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

layout:set() -- se va pa screen
theme:set()

global:set_up(confy.keys.global, confy.buttons.global)
clients:set_up(confy.keys.client, confy.buttons.client)

-- TODO:
-- local taglist_buttons, taglist_keys = taglist:build()
-- local tasklist_buttons, tasklist_keys = tasklist:build()
-- sumtin like that

signals:connect()
