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
		blender-bin.url = "github:edolstra/nix-warez?dir=blender";
	};

	outputs = { self, ... } @inputs :
	let
		system = "x86_64-linux";
		pkgs = import inputs.nixpkgs-stable {
			inherit system;
			overlays = [
				( import ./overlays/nbfc-overlay.nix)
				inputs.blender-bin.overlays.default
			];
			config.allowUnfree = true;
		};
	in
	{
		nixosConfigurations.default = inputs.nixpkgs-stable.lib.nixosSystem{
			inherit system pkgs;
			specialArgs = { inherit inputs; };
			modules = [
				./host/variable.nix
				./host/configuration.nix
			];
		};

		homeConfigurations.default = inputs.home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs; };
			modules = [
				./host/variable.nix
				./host/home.nix
			];
		};
	};
}
