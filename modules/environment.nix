{ pkgs, lib, currentSystemName, pkgs-unstable, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      bat
      delta
      eza
      git
      git-lfs
      gnumake
      ltex-ls
      xclip
    ] ++ (with pkgs-unstable; [
      lychee
    ]);

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    # required for zsh autocomplete
    pathsToLink = [ "/share/zsh" ];
  };
}
