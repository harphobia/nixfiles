{ self, ... }: {

  flake.nixosModules.users = { ... }: {
    imports = [
      self.nixosModules.user
    ];
  };

}