{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    user = {
    name = "zumuvik";
    email = "toovalvedota2@gmail.com";
    };
    settings = {
      push.autoSetupRemote = true;

      credential."https://github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];

      credential."https://gist.github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];
    };
  };
}
