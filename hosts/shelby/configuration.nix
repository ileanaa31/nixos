{ ... }:

{
  imports = [
    ../generic/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "shelby"; # Define your hostname.
}
