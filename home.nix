{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "zumuvik";
  home.homeDirectory = "/home/zumuvik";

  imports = [
    ./modules/programs
    ./profile/desktop
  ];

  home.stateVersion = "26.11";

  programs.waybar.enable = true;
  programs.home-manager.enable = true;

  programs.zen-browser = {
    enable = true;
  };

  # Декларативная настройка VS Code и его расширений

  home.packages = with pkgs; [
    # Устанавливаем сам OpenCode (GUI и консольный)
    opencode-desktop
    opencode

    # Инструменты для автокомплита и форматирования .nix файлов
    nixd
    nixpkgs-fmt

    # Для MCP серверов
    nodejs
  ];
}
