{
  description = "Мой первый конфиг с Home Manager";

  inputs = {
    # Основной репозиторий пакетов (unstable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    
    # Правильное подключение Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Добавляем OpenCode и расширения VSCode
    opencode-nix.url = "github:dan-online/opencode-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs @ { self, nixpkgs, zen-browser, home-manager, opencode-nix, nix-vscode-extensions, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        
        # Подключаем оверлеи, чтобы новые пакеты были доступны в pkgs
        {
          nixpkgs.overlays = [
            opencode-nix.overlays.default
            nix-vscode-extensions.overlays.default
          ];
        }
        
        # Настройка Home Manager внутри системного конфига
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
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

