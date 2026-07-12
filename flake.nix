{
  description = "Мой первый конфиг с Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
  };

  outputs =
    inputs @ {
      self,
      nixpkgs,
      zen-browser,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

            home-manager.users.zumuvik = { config, pkgs, ... }: {
              imports = [
                inputs.zen-browser.homeModules.default
                ./home.nix
              ];
            };
          }
        ];
      };
    };
}
