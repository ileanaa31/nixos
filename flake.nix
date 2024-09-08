{
	description = "The Flake to rule them all";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
	};

	outputs = { nixpkgs, ... }@inputs: {
		nixosConfigurations.robert = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			system = "x86_64-linux";
			modules = [
				./configuration.nix
			];
		};
	};
}
