{ pkgs-unstable, ... }:
{
  programs.lazygit = {
    enable = true;
    package = pkgs-unstable.lazygit;
  };
}
