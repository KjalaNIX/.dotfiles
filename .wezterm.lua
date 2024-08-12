-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Hybrid (Gogh)'
config.font = wezterm.font {
    family = 'JetBrains Mono',
    weight = 'Light',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

}

config.keys = {
  {
    key = 'q',
    mods = 'SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}
config.colors = {
    scrollbar_thumb = '#7F7D9C'
}
config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.exe', '-l' }
config.enable_scroll_bar = true
config.window_background_opacity = 0.6
config.window_frame = {
    font = wezterm.font { family = 'JetBrains Mono'}
}
config.launch_menu = {
    {
        label = 'NuShell',
        args = { 'C:/Users/Kjala/AppData/Local/Programs/nu/bin/nu.exe', '-l' },
    },
    {
        label = 'Cygwin',
        args = { 'C:/ProgramData/chocolatey/bin/cygwin.exe', '-l' },
    },
    {
        label = 'cmd',
        args = { 'C:/Windows/system32/cmd.exe', '-l' },
    }
}
    
-- and finally, return the configuration to wezterm
return config
