_:

{
  networking.firewall.allowedTCPPorts = [ 9876 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.firewall.checkReversePath = "loose";

}
