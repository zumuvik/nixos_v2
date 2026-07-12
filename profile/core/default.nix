{ ... }:

{
  imports = [
    ./boot.nix # загрузчик епта
    ./fonts.nix # шрифта
    ./localization.nix # язык и локали
    ./network.nix # инет
    ./users.nix # юзер
    ./firewall.nix # не глупый. da
    ./zram.nix # zram сука
    ./swap.nix # подкачка типа качок
    ./nh.nix # типа никс помощь
  ];

}
