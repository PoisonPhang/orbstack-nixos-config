{ inputs, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        scrolloff = 8;
        text-width = 128;
        soft-wrap = {
          enable = true;
          wrap-at-text-width = true;
          max-wrap = 32;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          render = true;
        };
      };
    };

    languages = {
      language-server = {
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
          };
        };

        nil = {
          config = {
            auto-format = true;
          };
        };

        ltex-ls = {
          command = "ltex-ls";
        };
      };

      language = [
        {
          name = "markdown";
          language-servers = [{ name = "ltex-ls"; }];
        }
      ];
    };
  };
}
