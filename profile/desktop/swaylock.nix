{ pkgs, ... }: {
programs.swaylock = {
  enable = true;
  package = pkgs.swaylock-effects;
  settings = {
    clock = true;
    timestr = "%R";
    datestr = "%a, %e %b";
    
    screenshots = true;
    fade-in = "0.2";
    effect-blur = "7x5";
    effect-vignette = "0.5:0.5";
    
    indicator = true;
    indicator-radius = 100;
    indicator-thickness = 7;
    
    line-color = "00000000";
    ring-color = "b4befe";
    inside-color = "1e1e2e";
    key-hl-color = "a6e3a1";
  };
};
}
