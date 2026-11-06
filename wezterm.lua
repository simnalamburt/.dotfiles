-- Windows specific
local w = require 'wezterm'
local c = w.config_builder()
local a = w.action

c.front_end = 'WebGpu'

-- Appearance
c.color_scheme = 'iTerm2 Dark Background'
c.font = w.font('MonacoLigaturized Nerd Font')
c.font_size = 16
c.audible_bell = 'Disabled'
c.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 1,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 200,
}
c.colors = {
  visual_bell = '#200000',
}
c.adjust_window_size_when_changing_font_size = false
c.native_macos_fullscreen_mode = true
c.send_composed_key_when_right_alt_is_pressed = false
c.show_new_tab_button_in_tab_bar = false
c.show_tab_index_in_tab_bar = false
c.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
c.window_frame = {
  border_left_width = '2px',
  border_right_width = '2px',
  border_bottom_height = '2px',
  border_top_height = '2px',
  border_left_color = '#333',
  border_right_color = '#333',
  border_bottom_color = '#333',
  border_top_color = '#333',
}
c.window_padding = {
  left = '9px',
  right = '9px',
  top = '3px',
  bottom = '3px',
}

c.default_domain = 'WSL:Arch'

c.keys = {
  {mods = 'CMD', key = 'Enter', action = a.ToggleFullScreen},
  {mods = 'CMD', key = '[', action = a.ActivatePaneDirection('Prev')},
  {mods = 'CMD', key = ']', action = a.ActivatePaneDirection('Next')},
  {mods = 'CMD', key = '-', action = a.SplitVertical},
  {
    mods = 'SUPER',
    key = 'mapped:\u{2013}', -- en dash: –
    action = a.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {mods = 'CMD', key = '\\', action = a.SplitHorizontal},
  {mods = 'CTRL', key = '1', action = a.ActivateTab(0)},
  {mods = 'CTRL', key = '2', action = a.ActivateTab(1)},
  {mods = 'CTRL', key = '3', action = a.ActivateTab(2)},
  {mods = 'CTRL', key = '4', action = a.ActivateTab(3)},
  {mods = 'CTRL', key = '5', action = a.ActivateTab(4)},
  {mods = 'CTRL', key = '6', action = a.ActivateTab(5)},
  {mods = 'CTRL', key = '7', action = a.ActivateTab(6)},
  {mods = 'CTRL', key = '8', action = a.ActivateTab(7)},
  {mods = 'CTRL', key = '9', action = a.ActivateTab(8)},
}

return c
