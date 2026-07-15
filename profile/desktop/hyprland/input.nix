{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
  input = {
          kb_layout = "us,ru";
          kb_options = "grp:alt_shift_toggle";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad.natural_scroll = false;
          scroll_method = "on_button_down";
          scroll_button = 276;
          scroll_button_lock = false;
          scroll_factor = 1.0;
        };
  };
}
