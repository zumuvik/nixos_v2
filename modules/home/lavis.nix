{ inputs, pkgs, ... }:

let
  lavisPackage = inputs.lavis.packages.${pkgs.stdenv.hostPlatform.system}.default;

  lavisAuth = pkgs.writeShellApplication {
    name = "lavis-auth";
    text = ''
      config_file="''${XDG_CONFIG_HOME:-$HOME/.config}/lavis/env"

      if [ ! -f "$config_file" ] || [ ! -r "$config_file" ]; then
        echo "Lavis configuration file is missing or unreadable: $config_file" >&2
        exit 1
      fi

      set -a
      # shellcheck disable=SC1090
      . "$config_file"
      set +a

      exec ${lavisPackage}/bin/lavis
    '';
  };
in
{
  home.file.".config/lavis/env.example".text = ''
    LAVIS_API_ID=your-api-id
    LAVIS_API_HASH=your-api-hash
  '';

  home.packages = [
    lavisPackage
    lavisAuth
  ];

  systemd.user.services.lavis = {
    Unit = {
      Description = "Lavis Telegram userbot";
      ConditionPathExists = [
        "%h/.config/lavis/env"
        "%h/.local/state/lavis/session"
      ];
    };
    Service = {
      ExecStart = "${lavisPackage}/bin/lavis";
      EnvironmentFile = "%h/.config/lavis/env";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
