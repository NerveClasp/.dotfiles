-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Batman"
config.color_scheme = "Catppuccin Mocha"
-- => != !== == === <= >= < > || &&
config.font = wezterm.font_with_fallback({
	"Berkeley Mono",
	"FiraCode Nerd Font",
	-- "Iosevka Nerd Font",
	-- "ComicShannsMono Nerd Font",
})
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8
-- config.window_background_opacity = 0.4
config.window_close_confirmation = "NeverPrompt"
config.keys = {
	-- fix for Ctrl+/ not working
	{ key = "/", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
}
config.font_size = 13.0
-- config.font_size = 13.0
-- TJ made me do this https://github.com/tjdevries/config_manager/blob/master/xdg_config/wezterm/wezterm.lua
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- config.kde_window_background_blur = true
-- and finally, return the configuration to wezterm
return config
