{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      credential."https://gist.github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];
      credential."https://github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];
      push.autoSetupRemote = true;
      user = {
        email = "toovalvedota2@gmail.com";
        name = "zumuvik";
      };
    };
  };
}
