# Orbstack NixOS Config

My NixOS [home-manager](https://nix-community.github.io/home-manager/) config specially built for [OrbStack](https://orbstack.dev/).

## Usage

To build, make sure you meet the [Nix Flakes Prerequisites](https://nix-community.github.io/home-manager/index.html#sec-flakes-prerequisites) and run the following:

```sh
sudo nixos-rebuild switch --flake .#headless-orb
```
