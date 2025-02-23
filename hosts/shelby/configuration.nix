{ ... }:
let
  # import from git repository (alternatively I could've added nixos-wsl in the flake.nix
  # but I did not want that input to be loaded for every host, so this seems like an adequate
  # change
  nixos-wsl = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/NixOS-WSL";
      ref = "main";
      rev = "c084e05fff6b2601de351e1bbee00485bf003f35"; # for newer version, update the commit sha
    }
  );
in
{
  imports = [
    nixos-wsl.nixosModules.wsl
    ../generic/configuration.nix
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
