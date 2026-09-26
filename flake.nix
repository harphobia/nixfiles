{
	inputs = {
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:vic/import-tree";
		helium.url = "github:schembriaiden/helium-browser-nix-flake";
		home-manager.url = "github:nix-community/home-manager";
		niri-flake.url = "github:epireyn/niri-flake";
		nixpkgs-xwayland-satellite-0-8-1.url = "github:nixos/nixpkgs/edfd59b795cd752c36d2dae60870cffcd23d3fb1";

		home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
		helium.inputs.nixpkgs.follows = "nixpkgs-unstable";
	};

	outputs = inputs: inputs.flake-parts.lib.mkFlake
	{ inherit inputs; }
	(inputs.import-tree ./modules);
}
