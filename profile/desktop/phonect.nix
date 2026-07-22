{
  config,
  lib,
  pkgs,
  ...
}:
{
  # phonect — P2P biometric unlock daemon
  # https://github.com/zumuvik/phonect
  services.phonect = {
    enable = true;
    settings = {
      daemon = {
        listen_host = "0.0.0.0";
        listen_port = 9876;
        poll_interval = 0.3;
        poll_timeout = 15.0;
      };
      device.pc_name = "my-laptop";
      device.unlock_on_start = false;
      keys.private_key = "/home/zumuvik/.config/phonect/pc_private.pem";
      keys.public_key = "/home/zumuvik/.config/phonect/trusted_device.pub";
      logging.level = "INFO";
    };
    user = "zumuvik";
  };
}
