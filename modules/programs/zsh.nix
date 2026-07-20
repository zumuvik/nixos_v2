{ config, pkgs, ... }:

{
  programs.zsh = {
    autosuggestion.enable = true;
    enable = true;
    # Автодополнение и умный поиск
    enableCompletion = true;
    # История команд
    history = {
      ignoreDups = true; # не сохранять дубликаты подряд
      path = "$HOME/.zsh_history";
      save = 10000;
      share = true; # шарить историю между вкладками терминала
      size = 10000;
    };
    # Опции самого Oh My Zsh
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo" # дважды тыкаешь Esc — подставляет sudo к прошлой команде
        "command-not-found" # подскажет, какой пакет поставить, если команды нет
      ];
      theme = "wedisagree"; # популярные: agnostes, bira, candy
    };
    # Твои кастомные алиасы (сокращения)
    shellAliases = {
      g = "git";
      la = "ls -la";
      v = "nvim";
    };
    syntaxHighlighting.enable = true;

  };
}
