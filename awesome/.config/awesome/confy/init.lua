local confy = require 'confy.configuration'
local layout = require 'confy.layout'
local keys = require 'confy.keys'
local rules = require 'confy.rules'

local theme = require 'confy.theme'

-- TODO: Maybe pass args here to show dependencies
--        at a first glance

confy:autostart()

keys:set()
rules:set()
layout:set()

theme:set()

confy:set_signals()
