{ isDarwin, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      bathelp = "bat --plain --language=help";
      cat = "bat";
      fzf-nix = "nix-env -qa | fzf";
      kssh = "kitty +kitten ssh -A";
      la = "eza -las extension";
      lg = "lazygit";
      ls = "eza";
      nd = "nix develop --command zsh";
      nixbuild-shell = "ssh eu.nixbuild.net shell";
      open = "xdg-open";
      tree = "exa -T";
      update-time = "sudo date -s \"$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z\"";
    };
  };
}

