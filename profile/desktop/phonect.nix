{ config, lib, pkgs, ... }: {
  # phonect — P2P biometric unlock daemon
  # https://github.com/zumuvik/phonect
  imports = [ /home/zumuvik/project/phonect/phonect-service.nix ];

  services.phonect = {
    enable = true;
    settings = {
      keys.private_key = "/home/zumuvik/.config/phonect/pc_private.pem";
      keys.public_key = "/home/zumuvik/.config/phonect/trusted_device.pub";
      device.pc_name = "my-laptop";
      device.unlock_on_start = false;
      daemon.listen_host = "0.0.0.0";
      daemon.listen_port = 9876;
      daemon.poll_interval = 0.3;
      daemon.poll_timeout = 15.0;
      logging.level = "INFO";
    };
  };
}
