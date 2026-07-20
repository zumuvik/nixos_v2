{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "Z /etc/nixos 0770 zumuvik zumuvik - -"
  ];
  users.groups.zumuvik = { };
  users.users.zumuvik = {
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
    ]; # Enable ‘sudo’ for the user.
    group = "zumuvik";
    isNormalUser = true;
    packages = with pkgs; [
      vscodium
      python3
      python3Packages.pip
      brightnessctl
      ayugram-desktop
      gh
      codex
    ];
    shell = pkgs.zsh;
  };
}
