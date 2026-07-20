{ config, pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      font-size = 24;
      ignore-empty-password = false;
      inside-clear-color = "a6e3a1";
      inside-color = "00000088";
      inside-ver-color = "89b4fa";
      inside-wrong-color = "f38ba8";
      key-hl-color = "89b4fa";
      line-color = "ffffff";
      ring-clear-color = "a6e3a1";
      ring-color = "ffffff";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "f38ba8";
      separator-color = "00000000";
      show-failed-attempts = true;
      text-caps-lock-color = "f9e2af";
      text-color = "ffffff";
    };
  };

}
