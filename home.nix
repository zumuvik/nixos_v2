{ config, pkgs, inputs, ... }:
{
  home.username = "zumuvik";
  home.homeDirectory = "/home/zumuvik";
  
  imports = [
    ./programs  
  ];  

  home.stateVersion = "26.11";

  programs.waybar.enable = true;
  programs.home-manager.enable = true;

  programs.zen-browser = {
    enable = true;
  };

  # Декларативная настройка VS Code и его расширений
  programs.vscode = {
    enable = true;
    # Берем расширения из оверлея open-vsx
    extensions = with pkgs.open-vsx; [
      jnoortheen.nix-ide # Расширение для работы с Nix
    ];

    # Настройки редактора, чтобы он видел наш языковой сервер (nixd)
    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
    };
  };

  # Декларативная установка плагина Plannotator для OpenCode
  home.file.".opencode.json".text = builtins.toJSON {
    plugin = [
      "@plannotator/opencode@latest" 
    ];
  };
 
  home.packages = with pkgs; [
    # Устанавливаем сам OpenCode (GUI и консольный)
    opencode-desktop 
    opencode
    
    # Инструменты для автокомплита и форматирования .nix файлов
    nixd
    nixpkgs-fmt
    
    # пример: fastfetch
  ];
}
