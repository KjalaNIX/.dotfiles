local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato (Gogh)'
config.font = wezterm.font {
    family = 'ShureTechMono Nerd Font',
    weight = 'Light',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

}

--config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true


-- Load tabline.wez plugin
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- Setup tabline.wez
tabline.setup({
  options = {
    theme = 'Catppuccin Macchiato (Gogh)',
  },
})

-- Optional

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    key = 'q',
    mods = 'SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  --Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
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
        label = 'cmd',
        args = { 'C:/Windows/system32/cmd.exe', '-l' },
    }
}

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#000B13',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#222d54',
      -- The color of the text for the tab
      fg_color = '#B7CFE6',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#000015',
      fg_color = '#B7CFE6',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#B7CFE6',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#222d54',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#B7CFE6',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
    scrollbar_thumb = '#B7CFE6'
}

for i = 0, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
      key = tostring(i),
      mods = "LEADER",
      action = wezterm.action.ActivateTab(i),
  })
end


local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

    
-- and finally, return the configuration to wezterm
return config
