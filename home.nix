{ config, pkgs, inputs, ... }:
{

  home.username = "zumuvik";
  home.homeDirectory = "/home/zumuvik";

    

 
  home.stateVersion = "26.11"; 

    programs.home-manager.enable = true;

   programs.zen-browser = {
    enable = true;
  };

 
  home.packages = with pkgs; [
    # пример: fastfetch
  ];
}

