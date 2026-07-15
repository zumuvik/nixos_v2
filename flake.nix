{
  description = "NixOS configuration for nixlensk321 and nixlensk322";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    phonect = {
      url = "github:zumuvik/phonect";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
          };

          modules = [
            (./hosts + "/${hostName}")

            inputs.phonect.nixosModules.default
            home-manager.nixosModules.home-manager

            {
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };

              home-manager.users.zumuvik = {
                imports = [
                  inputs.zen-browser.homeModules.default
                  ./home.nix
                ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        nixlensk321 = mkHost "nixlensk321";
        nixlensk322 = mkHost "nixlensk322";
      };
    };
}
