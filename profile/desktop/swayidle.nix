{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
      lock = "${pkgs.swaylock}/bin/swaylock -f";
    };
    systemdTargets = [ "graphical-session.target" ];
  };
}
