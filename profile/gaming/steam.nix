{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];

  programs.steam = {
    dedicatedServer.openFirewall = true;
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    package = pkgs.millennium-steam;
    remotePlay.openFirewall = true;
  };
}
