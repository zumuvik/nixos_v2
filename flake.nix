{
  description = "NixOS configuration for nixlensk321 and nixlensk322";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    codebase-memory-mcp = {
      url = "github:DeusData/codebase-memory-mcp";
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
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};

      nixFiles = ''
        find . \
          -name .git -prune -o \
          -name result -prune -o \
          -name 'result-*' -prune -o \
          -name '*.nix' -print
      '';

      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = [
            (./hosts + "/${hostName}")

            inputs.phonect.nixosModules.default
            inputs.home-manager.nixosModules.home-manager

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

      formatter.${system} = pkgs.nixfmt;

      checks.${system} = {
        nixfmt =
          pkgs.runCommand "nixfmt-check"
            {
              nativeBuildInputs = [ pkgs.nixfmt ];
              src = ./.;
            }
            ''
              cp -r "$src" source
              chmod -R u+w source
              cd source

              (${nixFiles}) | xargs --no-run-if-empty nixfmt --check

              touch "$out"
            '';

        statix =
          pkgs.runCommand "statix-check"
            {
              nativeBuildInputs = [ pkgs.statix ];
              src = ./.;
            }
            ''
              cp -r "$src" source
              chmod -R u+w source
              cd source

              statix check .

              touch "$out"
            '';

        deadnix =
          pkgs.runCommand "deadnix-check"
            {
              nativeBuildInputs = [ pkgs.deadnix ];
              src = ./.;
            }
            ''
              cp -r "$src" source
              chmod -R u+w source
              cd source

              (${nixFiles}) | xargs --no-run-if-empty deadnix --no-lambda-pattern-names --fail

              touch "$out"
            '';
      };
    };
}
