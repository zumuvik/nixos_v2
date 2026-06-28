{ pkgs, ... }: {
services.swayidle = {
  enable = true;
   events = {
     before-sleep = "${pkgs.swaylock-effects}/bin/swaylock -f";   
      lock = "${pkgs.swaylock-effects}/bin/swaylock -f"; 
  };
   systemdTargets = [ "graphical-session.target" ];
 };
}
