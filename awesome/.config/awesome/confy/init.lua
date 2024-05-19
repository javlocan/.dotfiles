local confy = require 'confy.configuration'
local layout = require 'confy.layout'

local theme = require 'confy.theme'
local menu = require 'confy.theme.menu'

confy:autostart()
confy:set_keys()
confy:set_rules()
layout:set()

theme:set()
menu:set()

confy:set_signals()
