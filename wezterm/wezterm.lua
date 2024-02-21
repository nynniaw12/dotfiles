local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.scrollback_lines = 3500
config.enable_scroll_bar = true

config.font_dirs = { '../fonts' }
config.hide_tab_bar_if_only_one_tab=true

config.color_scheme = 'Kanagawa (Gogh)'
config.font =
  wezterm.font('MesloLGS NF', { weight = 'Regular', italic = false })

return config
