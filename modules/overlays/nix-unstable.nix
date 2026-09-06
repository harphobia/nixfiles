{ self, inputs, ... }: {
    flake.overlays.nixpkgs-stable = final: prev: {
        stable = import inputs.nixpkgs-stable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
        };
    };
}
