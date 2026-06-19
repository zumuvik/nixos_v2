{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    # Автодополнение и умный поиск
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # История команд
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true; # не сохранять дубликаты подряд
      share = true;      # шарить историю между вкладками терминала
    };

    # Твои кастомные алиасы (сокращения)
    shellAliases = {
      la = "ls -la";
      v = "nvim";
      g = "git";
    };

    # Опции самого Oh My Zsh
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # популярные: agnostes, bira, candy
      plugins = [
        "git"
        "sudo"       # дважды тыкаешь Esc — подставляет sudo к прошлой команде
        "command-not-found" # подскажет, какой пакет поставить, если команды нет
      ];
    };

  };
}
