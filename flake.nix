{
	inputs = {
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
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
		pkgs-unstable = import inputs.nixpkgs-stable {
			inherit system;
			config.allowUnfree = true;
		};
	in
	{
		nixosConfigurations.default = inputs.nixpkgs-stable.lib.nixosSystem{
			inherit system pkgs;
			specialArgs = { inherit pkgs-unstable; };
			modules = [
				./host/configuration.nix
			];
		};
		
		homeConfigurations.default = inputs.home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit pkgs-unstable; };
			modules = [
				./home/home.nix
			];
		};

	};
}
