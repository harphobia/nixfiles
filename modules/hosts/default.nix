{ self, inputs, ... }: {
  flake.nixosConfigurations.nitro = inputs.nixpkgs-stable.lib.nixosSystem {
    modules = [
      self.nixosModules.nitroConfiguration
    ];
  };

  imports = [
	  inputs.home-manager.flakeModules.home-manager
  ];
}