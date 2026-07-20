{ lib, my, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "AyuGram"
      "zen-beta"
      "Throne"
      "foot --server"
    ];
  };
}
