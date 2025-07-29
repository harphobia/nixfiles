{
	inputs = {
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs-stable";
		};
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.05";
			inputs.nixpkgs.follows = "nixpkgs-stable";
		};
	};

	outputs = { self, ... } @inputs :
	let
		system = "x86_64-linux";
		pkgs = import inputs.nixpkgs-stable {
			inherit system;
			config.allowUnfree = true;
		};
	in
	{
		nixosConfigurations.os = inputs.nixpkgs-stable.lib.nixosSystem{
			inherit system pkgs;
			specialArgs = { inherit inputs; };
			modules = [
				./host/os/configuration.nix
			];
		};

		homeConfigurations.user = inputs.home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs; };
			modules = [
				inputs.stylix.homeModules.stylix
				inputs.nixvim.homeModules.nixvim
				./users/user/home.nix
			];
		};
	};
}
