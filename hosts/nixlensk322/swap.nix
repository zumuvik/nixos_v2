{ config, pkgs, ... }:

{

  swapDevices = [
    {
      device = "/swap/swapfile";
      priority = 1; # Низкий приоритет: включится, только если ZRAM переполнится
    }
  ];
}
