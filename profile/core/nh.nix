{ config, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos"; # Путь к твоему флейку, чтобы не писать его каждый раз
  };
}
