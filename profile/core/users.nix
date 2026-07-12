{ pkgs, ... }:

{
 users.users.zumuvik = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
    vscodium python3 python3Packages.pip brightnessctl ayugram-desktop gh codex
     ];
   };
}
