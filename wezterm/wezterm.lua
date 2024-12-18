local wezterm = require("wezterm")
return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 16.0,
	macos_window_background_blur = 30,
	native_macos_fullscreen_mode = false,
	-- background = {
	-- 	{
	-- 		source = {
	-- 			File = '~/Downloads/Blur-Wallpapers-07-2560-x-1600.jpg',
	-- 		},
	-- 		-- height = 'Contain',
	-- 		-- width = 'Contain',
	-- 		-- repeat_x = 'NoRepeat',
	-- 		-- repeat_y = 'NoRepeat',
	-- 		hsb = {
	-- 			-- hue = 0.1,
	-- 			brightness = 0.15,
	-- 			saturation = 0.7,
	-- 		},
	-- 	},
	-- },
	-- window_background_opacity = 0.85,
	window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	-- keys = {
	-- 	{
	-- 		key = "f",
	-- 		mods = "CTRL",
	-- 		action = wezterm.action.ToggleFullScreen,
	-- 	},
	-- },
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	set_environment_variables = {
		XDG_CONFIG_HOME = "/Users/anatolii/.config",
	},
}
