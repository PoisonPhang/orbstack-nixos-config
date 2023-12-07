{ pkgs-unstable, isDarwin, ... }:
{
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij;
    settings = {
      pane_frames = false;
      theme = "catppuccin-mocha";
    };
  };
}
