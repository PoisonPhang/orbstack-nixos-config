{ pkgs, lib, currentSystemName, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      git-lfs
      gnumake
      xclip
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
