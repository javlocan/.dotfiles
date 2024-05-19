local conf = require 'confy.configuration'
local menu = require 'confy.theme.menu'

conf:autostart()
conf:set_keys()
conf:set_rules()
conf:set_theme()
menu:set()
conf:set_signals()
