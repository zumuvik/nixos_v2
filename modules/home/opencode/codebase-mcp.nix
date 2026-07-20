{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.codebase-memory-mcp.packages.${pkgs.system}.default
  ];
}
