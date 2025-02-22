{ ... }:

{
  system.stateVersion = "25.05";
  wsl = {
   enable = true;
   defaultUser = "anton";
   wslConf.network.hostname = "shelby";
  };

  networking.hostName = "shelby"; # Define your hostname.
}
