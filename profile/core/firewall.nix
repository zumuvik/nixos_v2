_:

{
  networking.firewall = {
    allowedTCPPorts = [ 9876 ];
    checkReversePath = "loose";
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    enable = false;
  };

}
