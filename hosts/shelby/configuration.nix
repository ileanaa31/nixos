{ pkgs, ... }:
{
  imports = [
    ../generic/configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
    home-manager
  ];

  wsl = {
    enable = true;
    defaultUser = "anton";
    startMenuLaunchers = true;

    wslConf = {
      network.hostname = "shelby";
      user.default = "anton";
    };
  };
}
