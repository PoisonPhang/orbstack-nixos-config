{ pkgs-unstable, ... }:
{
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij;
    settings = {
      pane_frames = false;
      theme = "catppuccin-mocha";
    };
  };
  home.file.".config/zellij/layouts/dev.kdl".source = ./zellij/dev.kdl;
}
