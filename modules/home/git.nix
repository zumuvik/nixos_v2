{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "zumuvik";
    userEmail = "toovalvedota2@gmail.com";

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
