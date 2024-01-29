{ isDarwin, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      fzf-nix = "nix-env -qa | fzf";
      lg = "lazygit";
      ls = "eza";
      la = "eza -las extension";
      cat = "bat";
      bathelp = "bat --plain --language=help";
      nd = "nix develop --command zsh";
      update-time = "sudo date -s \"$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z\"";
      nixbuild-shell = "ssh eu.nixbuild.net shell";
      kssh = "kitty +kitten ssh -A";
      open = "xdg-open";
    };
  };
}

