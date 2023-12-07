{ pkgs, lib, currentSystemName, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      git-lfs
      gnumake
      xclip
      docker-client
      ltex-ls
      eza
      bat
    ];

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    # required for zsh autocomplete
    pathsToLink = [ "/share/zsh" ];
  };
}
