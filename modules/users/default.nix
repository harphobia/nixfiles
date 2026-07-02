{ self, inputs, ... }: {

  flake.nixosModules.users = { ... }: {
    imports = [
      inputs.home-manager.flakeModules.home-manager
      self.nixosModules.user
    ];
  };

  flake.homeConfigurations.user = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [
      self.homeModules.user 
    ];
  };

}