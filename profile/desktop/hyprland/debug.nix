{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    debug = {
      disable_logs = false;
      overlay = false;
    };
  };
}
