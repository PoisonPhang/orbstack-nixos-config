{ pkgs, pkgs-unstable, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      bat
      bottom
      delta
      eza
      fd 
      file
      fzf
      gh
      git
      git-lfs
      gnumake
      gnupg
      jq
      ltex-ls
      nil
      ssh-to-pgp
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
