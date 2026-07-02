{ self, inputs, ... }: {
  flake.nixosConfigurations.nitro = inputs.nixpkgs-stable.lib.nixosSystem {
    modules = [
      self.nixosModules.nitro
      self.nixosModule.nitroHardwareConfiguration
    ];
  };
}