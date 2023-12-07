{ pkgs, ... }:
{
  users = {
    users.poisonphang = {
      isNormalUser = true;
      home = "/home/poisonphang";
      extraGroups = [ "docker" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
