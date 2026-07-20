{ lib, ... }:

let
  collectModules =
    dir:
    lib.concatLists (
      lib.mapAttrsToList (
        name: type:
        let
          path = dir + "/${name}";
        in
        if type == "directory" && name != "_lib" then
          collectModules path
        else if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix" then
          [ path ]
        else
          [ ]
      ) (builtins.readDir dir)
    );
in
{
  imports = collectModules ./.;
}
