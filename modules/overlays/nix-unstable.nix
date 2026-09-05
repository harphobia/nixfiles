{ self, inputs, ... }: {
    flake.overlays.nixpkgs-unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
        };
    };
}