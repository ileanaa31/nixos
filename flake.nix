{
  description = "The Flake to rule them all";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    { nixpkgs, nixos-wsl, ... }@inputs:
    {
      nixosConfigurations.robert = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/robert/configuration.nix
        ];
      };
      nixosConfigurations.shelby = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
	  nixos-wsl.nixosModules.default
	  {
	    system.stateVersion = "24.05";
	    wsl = {
	      enable = true;
              defaultUser = "anton";
	      wslConf.network.hostname = "shelby";
	    };
	  }
	  ({pkgs, ...}: {
	    environment.systemPackages = with pkgs; [
	      git
	      vim
	      home-manager
	    ];
	  })
        ];
      };
    };
}
