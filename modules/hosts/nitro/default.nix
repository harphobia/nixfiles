{ self, inputs, ... }: {
  flake.nixosConfigurations.nitro = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nitro
      self.nixosModule.nitroHardwareConfiguration
    ];
  };
}