-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

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

config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- always start maximised
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end)

-- necessary for https://github.com/folke/zen-mode.nvim
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
