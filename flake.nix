{
  description = "NixOS configuration for nixlensk321 and nixlensk322";

  inputs = {
    codebase-memory-mcp = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:DeusData/codebase-memory-mcp";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    lavis = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:zumuvik/lavis";
    };
    millennium = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    phonect = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:zumuvik/phonect";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
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

      formatter = pkgs.writeShellApplication {
        name = "nixos-v2-format";
        runtimeInputs = [
          pkgs.findutils
          pkgs.git
          pkgs.nixfmt
        ];
        text = ''
          set -euo pipefail

          files=()

          collect_path() {
            local path="$1"

            if [[ -d "$path" ]]; then
              while IFS= read -r -d "" file; do
                files+=("$file")
              done < <(
                find "$path" \
                  -name .git -prune -o \
                  -name result -prune -o \
                  -name 'result-*' -prune -o \
                  -type f -name '*.nix' -print0
              )
            elif [[ -f "$path" && "$path" == *.nix ]]; then
              files+=("$path")
            fi
          }

          if (( $# == 0 )); then
            while IFS= read -r -d "" file; do
              files+=("$file")
            done < <(git ls-files -z -- '*.nix')
          else
            for path in "$@"; do
              collect_path "$path"
            done
          fi

          if (( ''${#files[@]} == 0 )); then
            exit 0
          fi

          nixfmt "''${files[@]}"
        '';
      };

      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;
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
          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      apps.${system}.format = {
        type = "app";
        program = "${formatter}/bin/nixos-v2-format";
      };
      checks.${system} = {
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
        lavis = inputs.lavis.packages.${system}.default;
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
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.deadnix
          pkgs.git
          pkgs.nixfmt
          pkgs.statix
        ];
        shellHook = ''
          if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            hook_path="$(git rev-parse --git-path hooks/pre-commit)"
            mkdir -p "$(dirname "$hook_path")"
            install -m 755 .githooks/pre-commit "$hook_path"
          fi

          echo "Formatting: nix fmt or nix run .#format"
          echo "Validation: nix flake check"
        '';
      };
      formatter.${system} = formatter;
      nixosConfigurations = {
        nixlensk321 = mkHost "nixlensk321";
        nixlensk322 = mkHost "nixlensk322";
      };
    };
}
