{ config, pkgs, ... }:

{
  imports = [
    ../generic/configuration.nix
  ];

  networking.hostName = "shelby"; # Define your hostname.
}
