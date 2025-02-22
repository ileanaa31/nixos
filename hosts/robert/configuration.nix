{ ... }:

{
  imports = [
    ../generic/configuration.nix
    ./hardware-configuration.nix
    ./hyprland.nix
  ];

  networking.hostName = "robert"; # Define your hostname.
}
