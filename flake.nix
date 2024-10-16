{
  description = "NixOS system configuration for Orbstack";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs:
    {
      nixosConfigurations = let system = "aarch64-linux"; in {
        headless-orb = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./orb/configuration.nix
            ./modules/zsh.nix
            ./modules/nix.nix
            ./modules/environment.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.poisonphang = {
                  imports = [
                    { home.stateVersion = "24.05"; }
                    ./home-modules/zsh.nix
                    ./home-modules/lazygit.nix
                    ./home-modules/git.nix
                    ./home-modules/zellij.nix
                    ./home-modules/direnv.nix
                    ./home-modules/helix.nix
                    ./home-modules/zoxide.nix
                    ./home-modules/starship.nix
                    ./home-modules/gpg.nix
                  ];
                };

                extraSpecialArgs = {
                  pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; config.allowUnfree = true; };
                  inherit inputs;
                };
              };
            }
            {
              config._module.args = {
                currentSystemName = "headless-orb";
                currentSystem = system;
                pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; config.allowUnfree = true; };
              };
            }
          ];
        };
      };
    } // (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        formatter = pkgs.nixpkgs-fmt;
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ nil nixpkgs-fmt ];
          };
        };
      }
    ));
}
