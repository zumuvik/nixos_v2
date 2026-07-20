{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      key_press_enables_dpms = false;
      mouse_move_enables_dpms = false;
    };
  };
}
