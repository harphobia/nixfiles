{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    home-manager.url = "github:nix-community/home-manager/release-26.05";

    niri-flake.url = "github:sodiboo/niri-flake";
    noctalia.url = "github:noctalia-dev/noctalia";
    helium.url = "github:schembriaiden/helium-browser-nix-flake";

    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
    noctalia.inputs.nixpkgs.follows = "nixpkgs-stable";
    helium.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    (inputs.import-tree ./modules);
}
