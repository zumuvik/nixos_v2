{
  config,
  inputs,
  pkgs,
  ...
}:
{
  home = {
    homeDirectory = "/home/zumuvik";
    # Декларативная настройка VS Code и его расширений
    packages = with pkgs; [
      # Устанавливаем сам OpenCode (GUI и консольный)
      opencode-desktop
      opencode

      # Инструменты для автокомплита и форматирования .nix файлов
      nixd
      nixpkgs-fmt

      # Для MCP серверов
      nodejs
      nwg-displays
      grim
      slurp
      wl-clipboard
      jq
      libnotify

    ];
    stateVersion = "26.11";
    username = "zumuvik";
  };
  imports = [
    ./modules/programs
    ./profile/desktop
    ./profile/desktop/hyprland/scripts
    ./modules/home
    ./modules/home/opencode
  ];
  programs = {
    home-manager.enable = true;
    waybar.enable = true;
    zen-browser = {
      enable = true;
    };
  };
}
