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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl = {
    enable = true;
    defaultUser = "anton";

    wslConf = {
      network.hostname = "shelby";
      user.default = "anton";
    };
  };

  system.stateVersion = "24.05";
}
