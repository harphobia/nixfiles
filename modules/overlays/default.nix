{ self, inputs, ... }: {

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs-stable {
      inherit system;
      overlays = if self ? overlays then builtins.attrValues self.overlays else [];
      config.allowUnfree = true;
    };
  };

  flake.nixosModules.overlays = { ... }: {
    nixpkgs.overlays = builtins.attrValues (self.overlays or {});
    nixpkgs.config.allowUnfree = true;
  };

}