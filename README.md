# NixOS configuration

Personal NixOS configuration for `nixlensk321` and `nixlensk322`.

<!-- TREE:START -->
```nix
.
├── .github
│   └── workflows
│       ├── auto-update.yml
│       ├── nixos-build.yml
│       └── update-tree.yaml
├── hosts
│   ├── nixlensk321
│   │   ├── configuration.nix
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── nixlensk322
│       ├── configuration.nix
│       ├── default.nix
│       ├── hardware-configuration.nix
│       └── swap.nix
├── modules
│   ├── home
│   │   ├── opencode
│   │   │   ├── codebase-mcp.nix
│   │   │   └── default.nix
│   │   ├── default.nix
│   │   └── git.nix
│   ├── nixos
│   │   ├── bluetooth
│   │   │   ├── blueman.nix
│   │   │   └── bluetooth.nix
│   │   ├── caches
│   │   │   └── cachix.nix
│   │   ├── default.nix
│   │   ├── greetd.nix
│   │   └── openssh.nix
│   ├── programs
│   │   ├── default.nix
│   │   ├── foot.nix
│   │   └── zsh.nix
│   └── services
│       └── default.nix
├── profile
│   ├── core
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── firewall.nix
│   │   ├── fonts.nix
│   │   ├── localization.nix
│   │   ├── network.nix
│   │   ├── nh.nix
│   │   ├── users.nix
│   │   └── zram.nix
│   ├── desktop
│   │   ├── hyprland
│   │   │   ├── scripts
│   │   │   │   ├── default.nix
│   │   │   │   └── screenshot.nix
│   │   │   ├── binds.nix
│   │   │   ├── debug.nix
│   │   │   ├── default.nix
│   │   │   ├── dwindle.nix
│   │   │   ├── env.nix
│   │   │   ├── exec-once.nix
│   │   │   ├── hyprland.nix
│   │   │   ├── input.nix
│   │   │   ├── misc.nix
│   │   │   ├── monitors.nix
│   │   │   ├── style.nix
│   │   │   ├── temple.nix
│   │   │   └── windowrule.nix
│   │   ├── default.nix
│   │   ├── phonect.nix
│   │   ├── swayidle.nix
│   │   ├── swaylock.nix
│   │   └── tofi.nix
│   └── gaming
│       ├── default.nix
│       └── steam.nix
├── .gitignore
├── LICENSE
├── README.md
├── flake.lock
├── flake.nix
├── home.nix
└── repository-tree.txt

20 directories, 62 files

```
<!-- TREE:END -->
