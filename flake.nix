{
description = "Мой первый конфиг"; #Любое название в "" btw

inputs = {
# Откуда берем пакеты (нестабильная ветка - самая свежая)
nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
};

outputs = { self, nixpkgs, ... }: {
# Замени 'nixos' на свое имя хоста (hostname)
nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
system = "x86_64-linux"; # если у вас arm то поменяйте, я че ебу че там
modules = [
./configuration.nix # Твой кфг
./hardware-configuration.nix
];
};
};
