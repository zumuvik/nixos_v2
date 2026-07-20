{ config, pkgs, ... }:

{
  # Настройка ZRAM
  zramSwap = {
    algorithm = "zstd"; # Zstd дает отличное сжатие при минимальной нагрузке на проц
    enable = true;
    memoryPercent = 50; # Выделим под ZRAM до 50% от твоих 8 ГБ (создастся 4 ГБ сжатой зоны)
    priority = 100; # Высокий приоритет: ZRAM заполняется в первую очередь
  };

}
