{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_THEME,Bibata-Modern-Classic"
      "XCURSOR_SIZE,24"
      "QT_QPA_PLATFORM,wayland"
    ];
  };
}
