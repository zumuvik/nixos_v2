_: {
  wayland.windowManager.hyprland.settings = {
    animations = {
      animation = [
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, quick, popin 87%"
        "fadeIn, 1, 1.73, default"
        "fadeOut, 1, 1.46, default"
        "workspaces, 1, 1.94, default, slide"
      ];
      bezier = [
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "quick, 0.15, 0, 0.1, 1"
      ];
      enabled = true;
    };
    decoration = {
      active_opacity = 0.95;
      blur = {
        brightness = 1.0;
        contrast = 1.0;
        enabled = true;
        ignore_opacity = true;
        new_optimizations = true;
        noise = 0.02;
        passes = 1;
        size = 1;
        vibrancy = 0.5;
        vibrancy_darkness = 0.5;
      };
      fullscreen_opacity = 1.0;
      inactive_opacity = 0.75;
      rounding = 12;
      shadow = {
        color = "rgba(1a1a1aee)";
        enabled = true;
        range = 15;
        render_power = 3;
      };
    };
    general = {
      border_size = 2;
      "col.active_border" = "rgba(ffffffaa) rgba(000000ee) 45deg";
      "col.inactive_border" = "rgba(222222aa)";
      gaps_in = 5;
      gaps_out = 20;
      layout = "dwindle";
      resize_on_border = false;
    };
  };
}
