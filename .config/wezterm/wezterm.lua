local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrainsMono NerdFont'
config.font_size = 10.0

config.color_scheme = 'Catppuccin Mocha'

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

return config
