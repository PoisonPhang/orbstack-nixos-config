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
      ripgrep
      ssh-to-pgp
      xclip
    ] ++ (with pkgs-unstable; [
      lychee
      _1password
    ]);

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
      TERM = "vt100";
    };

    # required for zsh autocomplete
    pathsToLink = [ "/share/zsh" ];
  };
}
