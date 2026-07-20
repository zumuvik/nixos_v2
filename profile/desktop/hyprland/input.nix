{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    input = {
      follow_mouse = 1;
      kb_layout = "us,ru";
      kb_options = "grp:alt_shift_toggle";
      scroll_button = 276;
      scroll_button_lock = false;
      scroll_factor = 1.0;
      scroll_method = "on_button_down";
      sensitivity = 0;
      touchpad.natural_scroll = false;
    };
  };
}
