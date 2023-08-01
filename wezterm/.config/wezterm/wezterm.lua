-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Color scheme and font
config.color_scheme = 'Dracula (Official)'
config.font = wezterm.font 'Fira Code'

-- do not hide mouse cursor due to bug
-- see https://github.com/wez/wezterm/issues/3726
config.hide_mouse_cursor_when_typing = false

-- https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = 'xterm-256color'



-- and finally, return the configuration to wezterm
return config
