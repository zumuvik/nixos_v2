{ pkgs, ... }:

{
  users.groups.zumuvik = { };
  users.users.zumuvik = {
    isNormalUser = true;
    shell = pkgs.zsh;
    group = "zumuvik";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      vscodium
      python3
      python3Packages.pip
      brightnessctl
      ayugram-desktop
      gh
      codex
    ];
  };
  systemd.tmpfiles.rules = [
    "Z /etc/nixos 0770 zumuvik zumuvik - -"
  ];
}
