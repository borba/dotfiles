-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16
config.line_height = 1.2
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = true
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"

-- For example, changing the initial geometry for new windows:
config.initial_cols = 140
config.initial_rows = 30
config.adjust_window_size_when_changing_font_size = true

config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

-- Finally, return the configuration to wezterm:
return config
