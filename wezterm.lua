local w = require 'wezterm'
local c = w.config_builder()
local a = w.action

-- c.color_scheme = 'Dracula' -- TODO
c.font = w.font('MonacoLigaturized Nerd Font Mono')
c.font_size = 18
c.front_end = 'WebGpu'
-- c.hide_tab_bar_if_only_one_tab = true -- TODO: need improvement
c.native_macos_fullscreen_mode = true
-- c.show_close_tab_button_in_tabs = false -- TODO: nightly only
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

c.keys = {
  {mods = 'CMD', key = 'Enter', action = a.ToggleFullScreen},
  {mods = 'CMD', key = 'm', action = a.SplitVertical},
  {mods = 'CMD', key = 'l', action = a.SplitHorizontal},
  {mods = 'CMD', key = '[', action = a.ActivatePaneDirection 'Prev'},
  {mods = 'CMD', key = ']', action = a.ActivatePaneDirection 'Next'},
}

return c
