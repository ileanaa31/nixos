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
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/shelby/configuration.nix
        ];
      };
    };
}
