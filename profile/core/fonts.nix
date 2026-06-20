{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono  
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-cjk-sans        
      noto-fonts-color-emoji                 
      twemoji-color-font
    ];

    # Дефолтные шрифты для системы
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}

