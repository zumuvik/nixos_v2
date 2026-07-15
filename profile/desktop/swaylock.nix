{ config, pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = false;
      show-failed-attempts = true;
      line-color = "ffffff";
      inside-color = "00000088";
      ring-color = "ffffff";
      key-hl-color = "89b4fa";
      text-color = "ffffff";
      separator-color = "00000000";
      text-caps-lock-color = "f9e2af";
      inside-clear-color = "a6e3a1";
      ring-clear-color = "a6e3a1";
      inside-ver-color = "89b4fa";
      ring-ver-color = "89b4fa";
      inside-wrong-color = "f38ba8";
      ring-wrong-color = "f38ba8";
      font-size = 24;
    };
  };

}
