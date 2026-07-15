{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "zumuvik";
        email = "toovalvedota2@gmail.com";
      };

      color.ui = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
