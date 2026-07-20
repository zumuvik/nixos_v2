{ config, pkgs, ... }:

{
  programs.nh = {
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    enable = true;
    flake = "/etc/nixos"; # Путь к твоему флейку, чтобы не писать его каждый раз
  };
}
