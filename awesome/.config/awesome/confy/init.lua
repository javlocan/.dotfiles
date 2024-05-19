local conf = require 'confy.configuration'
local theme = require 'confy.theme'
local layout = require 'confy.layout'
local menu = require 'confy.theme.menu'

conf:autostart()
conf:set_keys()
conf:set_rules()
layout:set()
theme:set()
menu:set()
conf:set_signals()
