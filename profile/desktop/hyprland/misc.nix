{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      key_press_enables_dpms = false;
      mouse_move_enables_dpms = false;
    };
  };
}
