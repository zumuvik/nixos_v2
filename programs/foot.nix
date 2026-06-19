{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
   server.enable = false; 

    settings = {
      main = {
        term = "xterm-256color";
        # Шрифты (размер 11, у тебя подтянется твой системный Nerd Font)
        font = "FiraCode Nerd Font:size=11";
        dpi-aware = "yes";
        pad = "12x12"; # Внутренние отступы от краев окна, чтобы код не лип
      };

      mouse = {
        hide-when-typing = "yes";
      };

      scrollback = {
        lines = 10000;
      };

      # Цветовая схема (по дефолту темная, приятная)
      colors = {
        alpha = "0.95"; # Небольшая прозрачность, если композитор поддерживает
        background = "1a1b26";
        foreground = "a9b1d6";
        
        # Палитра (пример для темы типа Tokyo Night)
        regular0 = "414868"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "7dcfff"; # cyan
        regular7 = "c0caf5"; # white
      };
    };
  };
}
