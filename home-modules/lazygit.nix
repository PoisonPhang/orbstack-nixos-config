{ pkgs-unstable, ... }:
{
  programs.lazygit = {
    enable = true;
    package = pkgs-unstable.lazygit;
    settings = {
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
    };
  };
}
